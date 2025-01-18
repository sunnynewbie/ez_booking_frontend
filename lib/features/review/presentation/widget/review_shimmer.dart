import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReviewShimmer extends StatelessWidget {
  const ReviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListtileShimmer();
      },
      separatorBuilder: (context, index) {
        return const Gap(AppDimens.space15);
      },
    );
  }
}

class ListtileShimmer extends StatelessWidget {
  const ListtileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius10),
        border: Border.all(color: AppColors.borderColor),
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.space15),
      padding: const EdgeInsets.only(
          left: AppDimens.space16,
          right: AppDimens.space16,
          bottom: AppDimens.space10),
      child: ListTile(
        leading: SizedBox().shimmerEffect(
          width: AppDimens.imageSize45,
          height: AppDimens.imageSize45,
        ),
        title: SizedBox().shimmerEffect(),
        subtitle: SizedBox().shimmerEffect(height: 14),
      ),
    );
  }
}
