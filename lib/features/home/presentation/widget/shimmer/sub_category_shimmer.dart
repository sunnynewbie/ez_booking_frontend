import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class SubCategoryShimmer extends StatelessWidget {
  const SubCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox().shimmerEffect(
          height: AppDimens.imageSize60,
          width: AppDimens.imageSize60,
        ),
        Gap(AppDimens.space5),
        SizedBox().shimmerEffect(),
      ],
    );
  }
}
