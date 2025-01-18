import 'dart:developer';

import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Appservice extends GetxService {
  static Appservice instance = Get.find();
  Rxn<UserModel> user = Rxn();
  Position? position;
  Future<bool> checkPermission() async {
    var result = await Permission.location.isGranted;
    if (result) {
      return true;
    }
    var status = await Permission.location.request();
    print(status);
    if (status == PermissionStatus.permanentlyDenied) {
      Geolocator.openAppSettings();
    }
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> onLocation() async {
    try {
      var location = await Geolocator.getCurrentPosition();
      position=location;
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    var user = PrefUtils().getUser();
    if (user != null) {
      this.user.value = user;
    }
    Future.delayed(Duration.zero, () async {
      try {
        await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: true,
          sound: true,
        );
        var fcmToken = await FirebaseMessaging.instance.getToken();
        log(fcmToken ?? '');
      } on Exception catch (e) {
        // TODO
      }
    });

  }

  Future<String> getCurrentCity() async {
    await onLocation();
    if(position==null){
      return '';
    }
    var address =await placemarkFromCoordinates(position!.latitude, position!.longitude);
    print(address.first.toJson());
    return address.first.locality??'';
  }

  Future<Appservice> init()async{
    return this;
  }
}

