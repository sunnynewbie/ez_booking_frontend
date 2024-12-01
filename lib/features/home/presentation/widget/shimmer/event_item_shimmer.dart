import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventGridShimmer extends StatelessWidget {
  const EventGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: const SizedBox().shimmerEffect(
                height: 90,
              ),
            ),
            Gap(AppDimens.space15),
            Expanded(
              child: const SizedBox().shimmerEffect(
                height: 90,
              ),
            )
          ],
        ),
        Gap(AppDimens.space8),
        Row(
          children: [
            Expanded(
              child: const SizedBox().shimmerEffect(
                height: 90,
              ),
            ),
            Gap(AppDimens.space15),
            Expanded(
              child: const SizedBox().shimmerEffect(
                height: 90,
              ),
            )
          ],
        ),
        Gap(AppDimens.space8),
        Row(
          children: [
            Expanded(
              child: const SizedBox().shimmerEffect(
                height: 90,
              ),
            ),
            Gap(AppDimens.space15),
            Expanded(
              child: const SizedBox().shimmerEffect(
                height: 90,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class EventHRListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _EventItemShimmer(),
        ),
        Gap(AppDimens.space15),
        Expanded(
          child: _EventItemShimmer(),
        )
      ],
    );
  }
}

class _EventItemShimmer extends StatelessWidget {
  const _EventItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius15),
        border: Border.all(color: AppColors.borderColor),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox().shimmerEffect(height: 130, width: double.maxFinite),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppDimens.space10),
                Center(child: SizedBox().shimmerEffect()),
                Gap(AppDimens.space10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox().shimmerEffect(),
                    Gap(AppDimens.space10),
                    SizedBox().shimmerEffect(
                      width: 110,
                      height: 14,
                    ),
                  ],
                ),
                Gap(AppDimens.space15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
