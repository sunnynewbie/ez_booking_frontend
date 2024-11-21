import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventDetailsField extends StatelessWidget {
  final String title;
  final String text;
  const EventDetailsField({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // color: Colors.red,
          width: size.width * 0.4,
          height: size.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.05,
                width: size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300]),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                title,
                style: AppTextStyle.regular5,
              )
            ],
          ),
        ),
        Flexible(
              child: Text(
                text,
                style: AppTextStyle.regular5,
                overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                maxLines: 1, // Limit the text to 2 lines
              ),
            ),
      ],
    );
  }
}
