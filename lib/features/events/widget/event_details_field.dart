import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventDetailsField extends StatelessWidget {
  final String title;
  final String text;
  const EventDetailsField({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:EdgeInsets.symmetric(vertical: AppDimens.space2),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
             flex: 2,
            child: Text(
              title,
              style: context.md14.weigh500,
            ),
          ),
          Expanded(
            flex: 5,
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
