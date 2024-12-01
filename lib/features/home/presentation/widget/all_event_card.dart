import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class AllEventCard extends StatelessWidget {
  final String text;
  final String text2;
  final String imgPath;
  final Color color1;
  final Color color2;
  const AllEventCard(
      {super.key,
      required this.text,
      required this.text2,
      required this.imgPath,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.centerLeft,
      padding:
          EdgeInsets.symmetric(horizontal: AppDimens.space15),
      decoration: BoxDecoration(
          color: color2,
          border: Border.all(color: color1, width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: AppDimens.space10),
            child: Text(
              text,
              style: context.md14.weigh600.copyWith(
                color: color1
              ) ),
          ),
          SizedBox(
            height: AppDimens.space5,
          ),
          Container(
            alignment: Alignment.centerLeft,
            // width: size.width * 0.35,
            child: Text(
              text2,
              style: context.md14.copyWith(
                color: color1
              )),
          ),
          // Container(
          //   color: Colors.red,
          //   height: size.height * 0.04,
          //   width: size.height * 0.08,
          // )
        ],
      ),
    );
  }
}
