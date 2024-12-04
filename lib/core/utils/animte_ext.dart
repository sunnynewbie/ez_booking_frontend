import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimteExt on Widget {
  Widget shimmerEffect({double height = 18, double width = 90}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        height: height,
        width: width,
        child: ColoredBox(
          color: AppColors.grey0f,
        ),
      )
          .animate(
            delay: 500.ms,
            onPlay: (controller) => controller.repeat(period: 500.ms),
          )
          .shimmer(color: Colors.white.withOpacity(0.5),),
    );
  }
}
