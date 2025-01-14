import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:flutter/material.dart';

Widget LivesInWidget() {
    return Container(
      padding: EdgeInsets.all(AppDimens.space12),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: AppDimens.space30,
            width: AppDimens.space30,
            child: ClipOval(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Text('Lives in India'),
        ],
      ),
    );
  }
