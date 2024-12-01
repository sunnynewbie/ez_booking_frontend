import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/features/home/presentation/widget/shimmer/event_item_shimmer.dart';
import 'package:ez_booking/features/home/presentation/widget/shimmer/sub_category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventByCategoryShimmer extends StatelessWidget {
  const EventByCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
      child: Column(
        children: [
          const Row(
            children: [
              SubCategoryShimmer(),
              Gap(AppDimens.space15),
              SubCategoryShimmer(),
              Gap(AppDimens.space15),
              SubCategoryShimmer(),
            ],
          ),
          const Gap(AppDimens.space15),
          EventHRListShimmer(),
          const Gap(AppDimens.space15),
          EventHRListShimmer(),
        ],
      ),
    );
  }
}
