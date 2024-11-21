import 'package:ez_booking/core/routes/route_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/utils/pref_util.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () async {
      var result = await PrefUtils().getUser();
      if (result != null) {
        Get.toNamed(RouteConfig.homePage);
      } else {
        if (PrefUtils().getBool('firstTime') ?? true) {
          Get.offNamedUntil(
            RouteConfig.onboarding,
            (route) => false,
          );
        } else {
          Get.offNamedUntil(RouteConfig.login, (route) => false);
        }
      }
      return;
      var locationEnable = await checkPermission();
      if (locationEnable) {
        var fetchLocation = await onLocation();
        if (fetchLocation) {}
      } else {
        Get.toNamed(RouteConfig.location);
      }
    });
  }

  checkPermission() async {
    var result = await Permission.location.isGranted;
    if (result) {
      return true;
    }
    var status = await Permission.location.request();

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
      Get.toNamed(RouteConfig.location);
      return false;
    }
  }
}
