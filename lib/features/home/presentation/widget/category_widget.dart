import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final String imgPath;
  const CategoryWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.imgPath});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // color: Colors.red,
            height: size.height * 0.08,
            width: size.height * 0.08,
            child: Image.asset(
              widget.imgPath,
              fit: BoxFit.fill,
              ),
          ),
          // SizedBox(
          //   // height: size.height * 0.013,
          // ),
          Container(
            // color: Colors.green,
            // width: ,
            padding: EdgeInsets.only(
                left: size.width * 0.03, right: size.width * 0.03),

            alignment: Alignment.center,
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: AppTextStyle.header1,
            ),
          ),
        ],
      ),
    );
  }
}
