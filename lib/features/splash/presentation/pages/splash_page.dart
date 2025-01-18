import 'package:ez_booking/controller/spalsh_controller.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/widget/app_icon.dart';
import 'package:ez_booking/features/splash/presentation/widgets/splash_bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: isDarkMode ? AppColors.primary : Colors.white,
            body: CustomPaint(
              painter: SplashBg(),
              child: Center(
                child: AppIcon(
                  showWhite: isDarkMode,
                ),
              ),
            ),
          );
        });
  }
}
