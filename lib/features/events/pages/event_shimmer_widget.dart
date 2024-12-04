import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventShimmerWidget extends StatelessWidget {
  const EventShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container().shimmerEffect(
            height: Get.width,
            width: Get.height,
          ),
          Gap(AppDimens.space10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            spacing: AppDimens.space15,
            children: List.generate(
              4,
              (index) => Container().shimmerEffect(
                height: AppDimens.imageSize75,
                width: AppDimens.imageSize75,
              ),
            ),
          ),
          Gap(AppDimens.space15),
          SizedBox().shimmerEffect(
            width: 190,
            height: 18,
          ),
          Gap(AppDimens.space10),
          Row(
            children: [
              Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: AppColors.grey78.withOpacity(.5),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
          Gap(AppDimens.space40),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space15,
              vertical: AppDimens.space16,
            ),
            height: Get.width,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius15),
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox().shimmerEffect(
                  width: 90,
                  height: 19,
                ),
                Gap(AppDimens.space15),
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.space10),
                    child: Row(
                      children: [
                        SizedBox().shimmerEffect(
                          height: AppDimens.space40,
                          width: AppDimens.space40,
                        ),
                        Gap(AppDimens.space10),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox().shimmerEffect(
                                width: 90,
                                height: 19,
                              ),
                              Spacer(),
                              SizedBox().shimmerEffect(
                                width: 90,
                                height: 19,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
