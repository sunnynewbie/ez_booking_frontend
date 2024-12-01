import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/app_size.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? imagePath;
  final Widget? child;
  final Color? iconColor;
  final double? iconSize;
  final BoxConstraints? constraints;
  final bool shrinkButton;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? borderColor;

  const AppIconButton(
      {this.imagePath,
      super.key,
      this.onPressed,
      this.child,
      this.shrinkButton = false,
      this.constraints,
      this.padding,
      this.borderColor,
      this.borderRadius,
      this.iconSize,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    // if (!isButton) {
    //   return GestureDetector(
    //     onTap: onPressed,
    //     child: child ??
    //         Image.asset(
    //           imagePath ?? LmgAssets.lmgBoxyLogo,
    //           color: iconColor,
    //           height: iconSize ?? 24,
    //           width: iconSize ?? 24,
    //         ),
    //   );
    // }
    return IconButton(
      onPressed: onPressed,
      padding: padding,
      constraints: constraints,
      style: IconButton.styleFrom(
        tapTargetSize: shrinkButton
            ? MaterialTapTargetSize.shrinkWrap
            : MaterialTapTargetSize.padded,
        side: BorderSide(color: borderColor ?? Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
      icon: child == null
          ? imagePath != null
              ? Image.asset(
                  imagePath!,
                  color: iconColor,
                  height: (iconSize ?? AppDimens.imageSize24).hs,
                  width: (iconSize ?? AppDimens.imageSize24).hs,
                )
              : SizedBox()
          : child!,
    );
  }
}
