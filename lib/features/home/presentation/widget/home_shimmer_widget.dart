import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'shimmer/event_item_shimmer.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(AppDimens.space15),
          SizedBox().shimmerEffect(),
          Gap(AppDimens.space15),
          Row(
            children: [
              CategoryShimmerItem(),
              Gap(AppDimens.space15),
              CategoryShimmerItem()
            ],
          ),
          Gap(AppDimens.space15),
          SizedBox().shimmerEffect(),
          Gap(AppDimens.space15),
          EventHRListShimmer(),
          Gap(AppDimens.space15),
          SizedBox().shimmerEffect(),
          Gap(AppDimens.space10),
          EventGridShimmer(),
          Gap(AppDimens.space15),
          SizedBox().shimmerEffect(),
          Gap(AppDimens.space10),
          EventHRListShimmer(),
        ],
      ),
    );
  }
}

class CategoryShimmerItem extends StatelessWidget {
  const CategoryShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(AppDimens.borderRadius15),
        ),
        height: 180,
        width: 120,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox().shimmerEffect(
              height: AppDimens.imageSize70,
              width: AppDimens.imageSize70,
            ),
            Gap(AppDimens.space10),
            SizedBox().shimmerEffect(
              width: 90,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
