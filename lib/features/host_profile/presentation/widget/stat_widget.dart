import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';

Widget Stat(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildStat('800', 'Reviews'),
                    buildStat('4.5', 'Ratings'),
                    buildStat('3', 'yr of\nhosting'),
                    AppElevatedButton(
                      onTap: () {},
                      fontColor: AppColors.primary,
                      text: 'Follow',
                      borderRadius: AppDimens.borderRadius20,
                      buttonColor: AppColors.white,
                    )
                  ],
                ),
    ],
  );
}

Widget buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
