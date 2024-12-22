import 'dart:developer';

import 'package:ez_booking/core/routes/route_config.dart';
import 'package:get/get.dart';

import '../core/utils/pref_util.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () async {
      var result = PrefUtils().getUser();

      if (result != null) {
        if (result.city!= null) {
          Get.offNamedUntil(AppRoutes.bottomNavBar, (route) => false);
        } else {
          Get.offNamedUntil(AppRoutes.allowLocation, (route) => false);
        }
      } else {
        if (PrefUtils().getBool('firstTime') ?? true) {
          Get.offNamedUntil(
            AppRoutes.onboarding,
            (route) => false,
          );
        } else {
          Get.offNamedUntil(AppRoutes.login, (route) => false);
        }
      }
    });
  }
}
