import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';

class HorizontalFlex extends StatelessWidget {
  const HorizontalFlex({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(size.width * 0.03),
        child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enables horizontal scrolling
        child: Row(
          children: List.generate(
            6, // Number of containers
            (index) => Container(
              width: size.height * 0.13,
              height: size.height * 0.15,
              margin: const EdgeInsets.all(0), // Adds spacing between containers
              // color: const Color.fromARGB(255, 212, 9, 9),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(size.width * 0.014),
                    height: size.height * 0.09,
                    width: size.height * 0.1,
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.014),
              color: const Color.fromARGB(169, 222, 218, 218),

              ),
              child: Image.asset(AppAssets.coconutTree),
              ),
              SizedBox(height: size.height * 0.01,),
                  Container(
                    height: size.height * 0.05,
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.02),

              ),
              child: Text('Camping', style: AppTextStyle.header1,),
              ),
                ],
              )
            ),
          ),
        ),
      ),
      );
  }
}