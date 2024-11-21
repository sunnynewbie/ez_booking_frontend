import 'dart:async';

import 'package:ez_booking/core/config/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController(viewportFraction: .25);
  PageController page2Controller = PageController(viewportFraction: .25);
  late Timer timer;
  var leftArry = [
    AppAssets.onboarding_1,
    AppAssets.onboarding_2,
    AppAssets.onboarding_3,
  ];
  var rightArray = [
    AppAssets.onboarding_6,
    AppAssets.onboarding_4,
    AppAssets.onboarding_5,
  ];

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (pageController.hasClients) {
        var pixel = pageController.position.pixels;
        pageController.jumpTo(pixel + 1);
        page2Controller.jumpTo(pixel + 1);
      }
    });
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
