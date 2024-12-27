import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/pages/event_list_page.dart';
import 'package:ez_booking/features/home/presentation/widget/horizontal_flex.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OneTimeExperience extends StatefulWidget {
  const OneTimeExperience({super.key});

  @override
  State<OneTimeExperience> createState() => _OneTimeExperienceState();
}

class _OneTimeExperienceState extends State<OneTimeExperience> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:  Text('One Time Experience', style: AppTextStyle.pagetitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalFlex(
              categories: [],
              onPressed: (item) {
                // Navigate to EventListPage using GetX
                // Get.to(() => const EventListPage());
              },
            ),
            Container(
              padding: EdgeInsets.only(left:size.width * 0.035,right:size.width * 0.035),
              child: Column(
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InfoCard(eventid: 1,),
                  // InfoCard(eventid: 1,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InfoCard(eventid: 1,),
                  // InfoCard(eventid: 1,)
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
