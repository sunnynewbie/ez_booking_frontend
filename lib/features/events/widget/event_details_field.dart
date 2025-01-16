import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventDetailsField extends StatelessWidget {
  final String iconPath;
  final String text;
  const EventDetailsField({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              // scale: 0.5, 
            ),
          ),
          SizedBox(width: AppDimens.space12), 
          Expanded(
            child: Text(
              text,
              style: context.md14.withgrey78,
            ),
          ),
        ],
      ),
    );
  }
}