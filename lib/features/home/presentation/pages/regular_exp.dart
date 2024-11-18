import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/home/presentation/widget/horizontal_flex.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';

class RegularExperience extends StatefulWidget {
  const RegularExperience({super.key});

  @override
  State<RegularExperience> createState() => _RegularExperienceState();
}

class _RegularExperienceState extends State<RegularExperience> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:  Text('Regular Experience', style: AppTextStyle.pagetitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalFlex(),
            Container(
              padding: EdgeInsets.only(left:size.width * 0.035,right:size.width * 0.035),
              child: Column(
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoCard(),
                  InfoCard()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoCard(),
                  InfoCard()
                ],
              ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}