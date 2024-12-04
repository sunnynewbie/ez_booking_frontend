import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../core/utils/pref_util.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () async {
      var result = await PrefUtils().getUser();

      if (result != null) {
        Get.offNamedUntil(AppRoutes.homePage, (route) => false);
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
