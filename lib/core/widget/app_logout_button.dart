import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

class AppLogoutButton extends StatelessWidget {
  final String text;
  final double height;
  const AppLogoutButton({super.key, required this.text, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1.1), 
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text(text,
      style: TextStyle(
        fontFamily: AppFont.lexend,
        color: AppColors.primary,
      ),
      ),
    );
  }
}
