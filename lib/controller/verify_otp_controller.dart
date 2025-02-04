import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/firebase_util.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifiactionArgs {
  String? verification_id;
  int? resendToken;
  String phoneNumber;

  VerifiactionArgs({
    required this.verification_id,
    required this.resendToken,
    required this.phoneNumber,
  });
}

class VerifyOtpController extends GetxController {
  RxString otpString = ''.obs;
  RxBool isLoading = false.obs; // Loading state
  var ctrl = TextEditingController();
  Timer? timer;
  var formKey = GlobalKey<FormState>();
  var timerCount = RxInt(60);

  Future<User?> _verifyFirebaseOtp() async {
    isLoading.value = true; // Start loading
    var user = await FirebaseUtil().loginWithPhone(
        verificationId: verifiactionArgs.verification_id ?? '',
        smsCode: ctrl.text.trim());
    return user;
  }

  Future<void> verifyOtp({bool fromDialog = false}) async {
    var user = await _verifyFirebaseOtp();
    if (user == null) {
      isLoading.value = false;
      return;
    }
    var deviceId = '';
    var fcm_token = '';
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
        deviceId = androidInfo.id;
        fcm_token = await FirebaseMessaging.instance.getToken() ?? '';
      } else {
        IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
        fcm_token = await FirebaseMessaging.instance.getToken() ?? '';
      }
    } on Exception catch (e) {
      // TODO
    }

    var response = await ApiRepository().verifyOtp({
      'phone_no': verifiactionArgs.phoneNumber,
      'firebase_id': user.uid,
      'device_id': deviceId,
      'fcm_token': fcm_token
    });
    isLoading.value = false;
    if (response.status) {
      await PrefUtils().setUser(response.data!);
      Appservice.instance.user.value = response.data;
      if (response.data!.city == null) {
        Get.offNamedUntil(AppRoutes.allowLocation, (route) => false);
        return;
      }
      if(fromDialog){
        Get.until((route) =>  route.settings.name==AppRoutes.eventDetail);
      }else{
        Get.offNamedUntil(
          AppRoutes.bottomNavBar,
              (route) => false,
        );
      }

    } else {
      ShowToast.showErrorMsg(response.message ?? '');
    }
  }

  late VerifiactionArgs verifiactionArgs;

  @override
  void onInit() {
    var args = Get.arguments as VerifiactionArgs;
    verifiactionArgs = args;
    super.onInit();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  startTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timerCount.value == 1) {
          timer?.cancel();
        }
        timerCount -= 1;
      },
    );
  }

  Future<void> sendOtp() async {
    isLoading.value = true;
    var phonNumber = verifiactionArgs.phoneNumber;
    FirebaseUtil().sendOtp(
      phonNumber,
      resendToken: verifiactionArgs.resendToken,
      codeAutoRetrievalTimeout: (verificationId) {
        isLoading.value = false;
      },
      codeSent: (verificationId, forceResendingToken) {
        isLoading.value = false;
        VerifiactionArgs verifiactionArgs = VerifiactionArgs(
            verification_id: verificationId,
            resendToken: forceResendingToken,
            phoneNumber: phonNumber);
        this.verifiactionArgs = verifiactionArgs;
        startTimer();
      },
      verificationCompleted: (credential) {
        isLoading.value = false;
        startTimer();
      },
      verificationFailed: (exception) {
        isLoading.value = false;
      },
    );
    /*var response =
        await ApiRepository().sendOTP({"phone_no": phoneCtrl.text.trim()});
    isLoading.value = false;
    if (response.status) {
      userModel.value = response.data;
      Get.toNamed(AppRoutes.verification, arguments: response.data);
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }*/
  }
}
