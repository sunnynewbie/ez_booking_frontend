import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle regular = TextStyle(
    fontSize: 10.5,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
    fontFamily: AppFont.lexend
  );
  static const TextStyle regular2 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: Colors.black38,
    fontFamily: AppFont.lexend
  );
  static const TextStyle regular3 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black26,
    fontFamily: AppFont.lexend
  );
  static const TextStyle regular4 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: AppFont.lexend
  );
  static const TextStyle regular4_fade_white = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: AppFont.lexend
  );
  static const TextStyle pagetitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: AppFont.lexend
  );

  // Bold TextStyle
  static const TextStyle bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Header TextStyle
  static const TextStyle header = TextStyle(
    fontSize: 15.5,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: AppFont.lexend
  );
  static const TextStyle header1 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: AppFont.lexend
  );

  // Subheading TextStyle
  static const TextStyle subheading = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: AppFont.lexend
  );

  // Caption TextStyle
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  // Large TextStyle
  static const TextStyle large = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Custom TextStyle with dynamic fontSize and color
  static TextStyle custom(double fontSize, Color color, {FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
