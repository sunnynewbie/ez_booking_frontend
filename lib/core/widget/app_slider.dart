import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/app_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppRangeSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final int _divisions = 2;
  final void Function(double)? onChanged;

  const AppRangeSlider.AppSlider(
      {required this.value,
      required this.min,
      required this.max,
      super.key,
      this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.space15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Gap(AppDimens.space5.hs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate((_divisions + 1),
                (index) => Text('${(index * (max ~/ _divisions))} km')),
          ),
          SliderTheme(
            data: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
            child: Slider(
              value: value,
              min: min,
              max: max,
              label: value.toString(),
              divisions: _divisions,
              onChanged: onChanged,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.textGrey.withOpacity(.20),
            ),
          ),
          Gap(AppDimens.space5.hs),
        ],
      ),
    );
  }
}
