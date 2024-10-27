import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/app_size.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String? buttonName;
  final Color? buttonColor;

  final VoidCallback? onTap;

  final double fontSize;
  final Color? fontColor;
  final Color borderColor;
  final double borderRadius;
  final Widget? childWidget;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool shirnkLoading;
  final EdgeInsetsGeometry? padding;

  const AppElevatedButton({
    required this.onTap,
    this.buttonName,
    super.key,
    this.buttonColor = AppColors.primary,
    this.fontSize = 13,
    this.fontColor = Colors.white,
    this.borderColor = AppColors.primary,
    this.borderRadius = AppDimens.circleRadius20,
    this.childWidget,
    this.padding,
    this.width,
    this.height,
    this.isLoading = false,
    this.shirnkLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? AppDimens.buttonHeight.hs,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: buttonColor,
          elevation: 0,
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: buttonColor,
          padding: padding,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
          // maximumSize: Size(500,height ?? 40.hs)
        ),
        onPressed: onTap,
        child: isLoading
            ? SizedBox(
                height: shirnkLoading ? 24.hs : null,
                width: shirnkLoading ? 24.ws : null,
                child: CircularProgressIndicator(color: fontColor),
              )
            : childWidget ??
                Text(
                  textAlign: TextAlign.center,
                  buttonName ?? '',
                  style: context.md13.weigh500.copyWith(
                      fontSize: fontSize, color: fontColor, height: 1.1),
                ),
      ),
    );
  }
}
