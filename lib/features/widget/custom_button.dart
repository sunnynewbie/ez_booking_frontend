import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  const CustomButtom({super.key, required this.text, required this.height, required this.width});

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.02),
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(size.width * 0.02)
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: AppFont.lexend,
          fontSize: size.height * 0.022,
          color: Colors.white,
          fontWeight: FontWeight.w200
        ),
      ),
    );
  }
}