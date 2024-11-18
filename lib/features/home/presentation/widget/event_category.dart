import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/home/presentation/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

class EventCategory extends StatefulWidget {
  const EventCategory({super.key});

  @override
  State<EventCategory> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(size.width * 0.04),
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Events Categories',
              style: AppTextStyle.header,
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryWidget(
                  height: size.height * 0.19,
                  width: size.width * 0.44,
                  text: 'One time Experience',
                  imgPath: AppAssets.tent,
                  onPressed: () => Get.toNamed(RouteConfig.oneTimeExperience),
                ),
                CategoryWidget(
                  height: size.height * 0.19,
                  width: size.width * 0.44,
                  text: 'Regular Experience',
                  imgPath: AppAssets.guiter,
                  onPressed: () => Get.toNamed(RouteConfig.regularExperience),
                ),
              ],
            )
          ],
        ));
  }
}
