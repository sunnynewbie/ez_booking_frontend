import 'package:ez_booking/core/config/app_color.dart';
import 'package:flutter/material.dart';
extension TextStyleExtension on BuildContext {
  TextStyle get h1 =>
      Theme.of(this).textTheme.displayMedium!.copyWith(fontSize: 60);

  TextStyle get h2 => Theme.of(this).textTheme.displayMedium!.copyWith(
        fontSize: _getResponsiveFontSize(this, baseFontSize: 50),
      );

  TextStyle get h45 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 44));

  TextStyle get h34 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 33));

  TextStyle get h32 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 31));

  TextStyle get h28 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 27));

  TextStyle get xs10 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 10));


  TextStyle get xs11 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 11));

  TextStyle get sm12 => Theme.of(this)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 12));

  TextStyle get md14 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 14));

  TextStyle get md13 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 13));

  TextStyle get lg15 => Theme.of(this)
      .textTheme
      .headlineLarge!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 15));

  TextStyle get lg16 => Theme.of(this)
      .textTheme
      .headlineLarge!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 16));

  TextStyle get xl18 => Theme.of(this)
      .textTheme
      .headlineMedium!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 18));

  TextStyle get x20 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 20));

  TextStyle get x22 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 22));

  TextStyle get x24 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 24));

  TextStyle get x26 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 26));

  TextStyle get x36 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: _getResponsiveFontSize(this, baseFontSize: 36));

  /*TextStyle getmd14(Size size) =>
      TextStyle().createFont( size,sizePx: 14, heightPx: 16.38);

  TextStyle getlg16(Size size) =>
      TextStyle().createFont( size,sizePx: 16, heightPx: 26);*/

  double _getResponsiveFontSize(BuildContext context,
      {double baseFontSize = 14.0}) {
    double responsiveFontSize = baseFontSize;
    return responsiveFontSize;
  }
}

extension StyleExtension on TextStyle {
  TextStyle get withBlack => copyWith(color: Color(0xff121212));


  TextStyle get withWhite => copyWith(color: Colors.white);

  TextStyle get withprimary => copyWith(color: AppColors.primary);

  TextStyle get withRed => copyWith(color: Colors.red);

  TextStyle get withSuccessColor => copyWith(color: Colors.green);

  TextStyle get withgrey78 => copyWith(color:AppColors.grey78);


  TextStyle get withErrorRed => copyWith(color: Colors.red.shade800);

  TextStyle get weigh300 => copyWith(fontWeight: FontWeight.w300);

  TextStyle get weigh400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get weigh500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get weigh600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get weigh700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle get weigh800 => copyWith(fontWeight: FontWeight.w800);

  TextStyle get weigh900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle get height1 => copyWith(height: 1);

  TextStyle get height2 => copyWith(height: 2);

  TextStyle get height1_5 => copyWith(height: 1.5);

  TextStyle get height1_6 => copyWith(height: 1.6);

  TextStyle get height1_7 => copyWith(height: 1.7);

  TextStyle get height1_8 => copyWith(height: 1.8);

  TextStyle get height1_9 => copyWith(height: 1.9);

  TextStyle get primaryLineTrough => copyWith(
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColors.primary);

  TextStyle get greyLineTrough => copyWith(
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColors.textGrey);

  TextStyle get blackunderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: Color(0xff121212));

  TextStyle get primaryUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: AppColors.primary);

  TextStyle get whiteUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: Colors.white);

  TextStyle get redUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor:Colors.red);

  TextStyle get greenUnderLine => copyWith(
      decoration: TextDecoration.underline, decorationColor: Colors.green);

  double get textShimmerSize => fontSize! + height!;
}

extension ColorExt on Color {
  fromPercentage(double percentage) {
    var value = percentage / 100;
    var alpha = value * 255;
    return this.withAlpha(alpha.toInt());
  }
}
