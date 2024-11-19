import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppOptionMenuButton<T> extends StatelessWidget {
  final List<PopupMenuItem<T>> items;
  final Color? iconColor;
  final void Function(T item)? onSelected;

  const AppOptionMenuButton(
      {required this.items, super.key, this.onSelected, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppDimens.borderRadius10)),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onSelected: onSelected,
      itemBuilder: (ctx) {
        return items;
      },
      child: Icon(
        Icons.more_vert_rounded,
        color: iconColor,
        size: AppDimens.imageSize20,
      ),
    );
  }
}
