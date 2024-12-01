import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Appservice extends GetxService {
  static Appservice instance = Get.find();

  Future<bool> checkPermission() async {
    var result = await Permission.location.isGranted;
    if (result) {
      return true;
    }
    var status = await Permission.location.request();
    print(status);
    if (status==PermissionStatus.permanentlyDenied) {
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
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
