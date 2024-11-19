import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
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
    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.centerLeft,
      width: size.width * 0.45,
      height: size.height * 0.12,
      padding:
          EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.03),
      decoration: BoxDecoration(
          color: color2,
          border: Border.all(color: color1, width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: size.height * 0.01),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.w600,
                  color: color1,
                  fontFamily: AppFont.lexend),
            ),
          ),
          SizedBox(
            height: size.height * 0.006,
          ),
          Container(
            alignment: Alignment.centerLeft,
            // width: size.width * 0.35,
            child: Text(
              text2,
              style: TextStyle(
                  fontSize: size.height * 0.017,
                  fontWeight: FontWeight.w200,
                  color: color1,
                  fontFamily: AppFont.lexend),
            ),
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
