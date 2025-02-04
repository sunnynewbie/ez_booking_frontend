import 'package:ez_booking/controller/location_controller.dart';
import 'package:ez_booking/controller/select_city_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AllowLocationPage extends StatelessWidget {
  const AllowLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (_) => AppScaffold(
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
                    Get.toNamed(AppRoutes.select_city,
                        arguments: SelectCityParam(cityName: ''));
                  },
                  child: Text(
                    'Enter location manually',
                    style: context.md14.blackunderLine,
                  ),
                ),
              ),
              Obx(
                () => AppElevatedButton(
                  isLoading: _.isLoading.value,
                  width: double.maxFinite,
                  onTap: () async {
                    _.isLoading.value = true;
                    var response = await Appservice.instance.checkPermission();
                    if (response) {
                      bool status = await Appservice.instance.onLocation();
                      if (status) {
                        var cityName =
                            await Appservice.instance.getCurrentCity();
                        if (cityName.isNotEmpty) {
                          Get.toNamed(AppRoutes.select_city,
                              arguments: SelectCityParam(cityName: cityName));
                        }
                        // Get.offNamedUntil(AppRoutes.splash,(route) => false,);
                      }
                      _.isLoading.value = false;
                    }
                  },
                  text: 'Allow location',
                ),
              ),
              Gap(AppDimens.space30),
            ],
          ),
        ),
      ),
    );
  }
}
