import 'package:ez_booking/controller/spalsh_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
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
          body: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: AppDimens.space15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.splashBG),
                ),
              ),
              child: ImageView(
                imageType: ImageType.asset,
                path: AppAssets.appIcon,
              ),
            ),
          ),
        );
      }
    );
  }
}
