import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  final String imgPath;
  final String text;
  const NotFound({super.key, required this.imgPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(imgPath),
          ),
        SizedBox(
          height: AppDimens.space10,
        ),
        Text(text,
          style: TextStyle(
            fontFamily: AppFont.lexend,
            color: AppColors.primary,
            fontSize: AppDimens.borderRadius15,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}