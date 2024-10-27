import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}
