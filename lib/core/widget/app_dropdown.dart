import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/app_size.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppDropdown<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String? hintText;
  final String? label;
  final Color? textColor;
  final Color? bgColor;
  final Color? iconColor;
  final FontWeight? hintTextWeight;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? iconPadding;
  final EdgeInsetsGeometry? itemPadding;
  final Function(T?)? onChanged;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? dropdownHeight;
  final double? dropdownItemHeight;
  final double? dropdownWidth;
  final Color? dropdownAreaColor;
  final bool enabled;
  final TextStyle? hintTextStyle;
  final TextStyle? fontTextStyle;
  final TextEditingController? controller;
  final bool searchEnable;
  final String? Function(T? value)? validator;
  final SearchMatchFn? function;
  final bool isAsterisk;

  const AppDropdown({
    required this.items,
    super.key,
    this.value,
    this.dropdownItemHeight,
    this.isAsterisk = true,
    this.label,
    this.hintText,
    this.hintTextWeight,
    this.itemPadding,
    this.bgColor,
    this.borderColor,
    this.iconColor,
    this.height,
    this.width,
    this.iconPadding,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: AppDimens.space16),
    this.onChanged,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownAreaColor,
    this.textColor,
    this.enabled = true,
    this.hintTextStyle,
    this.fontTextStyle,
    this.searchEnable = false,
    this.controller,
    this.function,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Column(
            children: [
              isAsterisk
                  ? RichText(
                      text: TextSpan(
                        text: label,
                        style: context.md13.withBlack.weigh500,
                        children: [
                          TextSpan(
                            text: ' *',
                            style: context.md13.withRed.weigh500,
                          )
                        ],
                      ),
                    )
                  : Text(
                      label ?? '',
                      style: context.md13.withBlack.weigh500,
                    ),
              Gap(AppDimens.space5.hs)
            ],
          ),
        DropdownButtonFormField2<T>(
          validator: validator,
          items: items,
          onChanged: enabled ? onChanged : null,
          value: value,
          style: fontTextStyle ?? context.md13,
          isExpanded: true,
          hint: Text(
            hintText ?? '',
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: hintTextStyle,
          ),
          /*   decoration: InputDecoration(
            disabledBorder: SquircleInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.borderColorGrey),
            ),
            border: SquircleInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.borderColorGrey),
            ),
            enabledBorder: SquircleInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.borderColorGrey),
            ),
            errorBorder: SquircleInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide: const BorderSide(color: AppColors.errorRed),
            ),
            focusedBorder: SquircleInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.borderColorGrey),
            ),
            focusedErrorBorder: SquircleInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide: const BorderSide(color: AppColors.errorRed),
            ),
            contentPadding: EdgeInsets.zero,
            filled: bgColor != null,
            fillColor: bgColor,
            enabled: enabled,
          ),*/
          decoration: InputDecoration.collapsed(
            hintText: 'hintText',
            hintStyle: hintTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.circleRadius30),
              borderSide: const BorderSide(color: AppColors.errorRed),
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: height ?? context.w(AppDimens.inputFieldHeight + 8),
            padding: iconPadding ?? EdgeInsets.only(right: AppDimens.space16),
            decoration: BoxDecoration(
              color: enabled ? bgColor : AppColors.textGrey,
              borderRadius: BorderRadius.circular(AppDimens.circleRadius15),
            ),
          ),
          iconStyleData: IconStyleData(
            openMenuIcon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.chevron_left,
                color: iconColor,
              ),
            ),
            icon: RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.chevron_left,
                color: iconColor,
              ),
            ),
            iconSize: 20
          ),
          dropdownSearchData: searchEnable
              ? DropdownSearchData(
                  searchController: controller,
                  searchMatchFn: function,
                  searchInnerWidget: Padding(
                    padding: EdgeInsets.only(
                        right: AppDimens.space10.hs,
                        left: AppDimens.space10.hs,
                        top: AppDimens.space10.hs),
                  ),
                  searchInnerWidgetHeight: 50.hs,
                )
              : null,
          menuItemStyleData: MenuItemStyleData(
            padding:itemPadding?? EdgeInsets.only(left: AppDimens.space12.hs),
            selectedMenuItemBuilder: (context, child) {
              return child;
            },
            height: dropdownItemHeight ?? AppDimens.imageSize55,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.only(right: AppDimens.space16.hs),
            elevation: !searchEnable ? 0 : 1,
            width: !searchEnable ? dropdownWidth : null,
            maxHeight: !searchEnable ? dropdownHeight : null,
            decoration: !searchEnable
                ? BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimens.borderRadius10),
                    border: Border.all(color: AppColors.borderColor),
                  )
                : const BoxDecoration(),
          ),
        )
      ],
    );
  }
}
