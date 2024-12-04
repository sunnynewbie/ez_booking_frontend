import 'package:ez_booking/controller/onboarding_controller.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OnboardingController(),
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _.pageController,
                        padEnds: false,
                        pageSnapping: false,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDimens.borderRadius10),
                          ),
                          margin: EdgeInsets.all(AppDimens.space5),
                          clipBehavior: Clip.hardEdge,
                          child: ImageView(
                            imageType: ImageType.asset,
                            boxFit: BoxFit.cover,
                            path: _.leftArry[index % _.leftArry.length],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _.page2Controller,
                        padEnds: false,
                        pageSnapping: false,
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDimens.borderRadius10),
                          ),
                          margin: EdgeInsets.all(AppDimens.space5),
                          clipBehavior: Clip.hardEdge,
                          child: ImageView(
                            imageType: ImageType.asset,
                            boxFit: BoxFit.cover,
                            path: _.rightArray[index % _.rightArray.length],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(AppDimens.space15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(.2),
                        Colors.white.withOpacity(.5),
                        Colors.white.withOpacity(.9),
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(
                        AppDimens.space20,
                      ),
                      Gap(
                        AppDimens.space20,
                      ),
                      Text(
                        'Welcome to Ezbook \n'
                        'Made for Everyone!',
                        style: context.x24.weigh600,
                        textAlign: TextAlign.center,
                      ),
                      Gap(AppDimens.space30),
                      AppElevatedButton(
                        width: double.maxFinite,
                        text: 'Get started',
                        onTap: () {
                          Get.offNamedUntil(AppRoutes.login,(route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
