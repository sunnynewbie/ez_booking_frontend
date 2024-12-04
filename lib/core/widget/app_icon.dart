import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final bool showWhite;

  const AppIcon({this.showWhite = false, super.key});

  @override
  Widget build(BuildContext context) {
    return ImageView(
      imageType: ImageType.asset,
      path: showWhite ? AppAssets.logoWhite : AppAssets.appIcon,
      width: MediaQuery.sizeOf(context).width / 2,
    );
  }
}
