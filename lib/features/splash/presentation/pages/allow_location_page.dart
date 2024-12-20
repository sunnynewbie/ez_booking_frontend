import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AllowLocationPage extends StatelessWidget {
  const AllowLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppDimens.space40),
            Text(
              'Setup your location',
              style: context.x24.weigh500,
            ),
            Gap(AppDimens.space10),
            Expanded(
              child: Center(
                child: ImageView(
                  imageType: ImageType.asset,
                  path: AppAssets.allowLocation,
                  height: Get.width,
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RouteConfig.location);
                },
                child: Text(
                  'Enter location manually',
                  style: context.md14.blackunderLine,
                ),
              ),
            ),
            AppElevatedButton(
              width: double.maxFinite,
              onTap: () async {
                var response = await Appservice.instance.checkPermission();
                if (response) {
                  bool status = await Appservice.instance.onLocation();
                  if (status) {
                    Get.offNamedUntil(RouteConfig.splash,(route) => false,);
                  }
                }
              },
              text: 'Allow location',
            ),
            Gap(AppDimens.space30),
          ],
        ),
      ),
    );
  }
}
