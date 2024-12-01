import 'package:ez_booking/controller/spalsh_controller.dart';
import 'package:ez_booking/core/widget/app_icon.dart';
import 'package:ez_booking/features/splash/presentation/widgets/splash_bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (_) {
          return Scaffold(
            body: CustomPaint(
              painter: SplashBg(),
              child: Center(
                child: AppIcon(),
              ),
            ),
          );
        });
  }
}
