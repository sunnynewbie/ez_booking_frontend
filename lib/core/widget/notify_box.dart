import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';

class NotifyBox extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color boxColor;
  final String imgPath;

  const NotifyBox(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.boxColor,
      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.92,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        // color: Colors.red,
        // gradient: LinearGradient(colors: [
        //   const Color.fromARGB(230, 36, 99, 176),
        //   // const Color.fromARGB(255, 43, 101, 172),
        //   const Color.fromARGB(210, 67, 137, 222),
        // ]),
        gradient: AppColors.blueGredient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.018,
                bottom: size.height * 0.01,
                left: size.height * 0.016),
            // color: Colors.green,
            width: size.width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.6,
                  child: Text(
                    text1,
                    style: AppTextStyle.regular4,
                  ),
                ),
                Container(
                  width: size.width * 0.6,
                  child: Text(
                    text2,
                    style: AppTextStyle.regular4_fade_white,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: size.height * 0.012, left: size.width * 0.007),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      color: boxColor,
                      borderRadius: BorderRadius.circular(4)),
                  height: size.height * 0.034,
                  width: size.width * 0.24,
                  child: Text(text3),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(size.height * 0.01),
            width: size.width * 0.27,
            // color: Colors.red,
            child: Image.asset(imgPath),
          )
        ],
      ),
    );
  }
}
