import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/app_size.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? hintTextStyle;
  final TextStyle? fontTextStyle;
  final String? hint;
  final String? label;
  final String? value;
  final VoidCallback? onTap;
  final bool showBorder;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChange;
  final void Function(String? value)? onSubmit;
  final void Function(String? value)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? enable;
  final bool readOnly;
  final bool obscureText;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputType keyboardType;
  final double borderRadius;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconSize;
  final BoxConstraints? prefixIconSize;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;

  const AppTextFormField(
      {this.controller,
      super.key,
      this.hintTextStyle,
      this.fontTextStyle,
      this.hint,
      this.value,
      this.onTap,
      this.showBorder = true,
      this.borderColor,
      this.height,
      this.validator,
      this.obscureText = false,
      this.inputFormatters = const [],
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.keyboardType = TextInputType.text,
      this.enable,
      this.readOnly = false,
      this.onChange,
      this.onSubmit,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconSize,
      this.prefixIconSize,
      this.filled = false,
      this.fillColor,
      this.borderRadius = AppDimens.borderRadius10,
      this.label,
      this.contentPadding,
      this.textCapitalization = TextCapitalization.none});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label ?? "",
            style: context.md13.weigh500,
          ),
          const Gap(AppDimens.space4),
        ],
        TextFormField(
          style: fontTextStyle ??context.md13,
          enabled: enable,
          keyboardType: keyboardType,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onSaved: onSaved,
          readOnly: readOnly,
          textCapitalization: textCapitalization,
          // textInputAction: TextInputAction.send,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          onTap: onTap,
          controller: controller,
          initialValue: value,
          validator: validator,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        constraints: BoxConstraints(
          minHeight: height ?? AppDimens.inputFieldHeight.hs,
          maxHeight: 10000.hs,
        ),
        isDense: true,
        contentPadding: contentPadding??const EdgeInsets.all(AppDimens.space15),
        suffixIconConstraints: suffixIconSize,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconSize,
        hintText: hint,
        // labelText: label,
        labelStyle:context.md13.withgrey78,
        hintStyle:
            hintTextStyle ??context.md13.withgrey78,
        filled: filled,
        disabledBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    BorderSide(color: borderColor ?? AppColors.borderColor),
              )
            : InputBorder.none,
        focusedErrorBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(color: AppColors.errorRed),
              )
            : InputBorder.none,
        enabledBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    BorderSide(color: borderColor ?? AppColors.borderColor),
              )
            : InputBorder.none,
        border: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    BorderSide(color: borderColor ?? AppColors.borderColor),
              )
            : InputBorder.none,
        errorBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(color: AppColors.errorRed),
              )
            : InputBorder.none,
        focusedBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide:
                    BorderSide(color: borderColor ?? AppColors.borderColor),
              )
            : InputBorder.none,
        fillColor: fillColor,
        counterText: '',
      ),
      obscureText: obscureText,
      inputFormatters: inputFormatters,
        )
      ]
    );
  }
}
