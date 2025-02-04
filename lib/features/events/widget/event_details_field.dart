import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class EventDetailsField extends StatelessWidget {
  final String iconPath;
  final String text;
  final String? subText;
  final String? rightIconPath;
  final VoidCallback? onRightButtonClick;

  const EventDetailsField({
    super.key,
    required this.iconPath,
    this.onRightButtonClick,
    required this.text,
    this.subText,
    this.rightIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: AppDimens.space30,
            height: AppDimens.space30,
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: AppDimens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: context.md14,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subText != null)
                  Text(
                    subText!,
                    style: context.sm12,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if (rightIconPath != null) ...[
            SizedBox(width: AppDimens.space12),
            IconButton(
              icon: Image.asset(
                rightIconPath!,
                fit: BoxFit.contain,
              ),
              onPressed: onRightButtonClick,
            ),
          ],
        ],
      ),
    );
  }
}
