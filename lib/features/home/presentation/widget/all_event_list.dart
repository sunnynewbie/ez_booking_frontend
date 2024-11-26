import 'package:ez_booking/controller/home_controller.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/home/presentation/widget/all_event_card.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllEvent extends StatelessWidget {
  final DashboardModel dashboardModel;
  const AllEvent({super.key, required this.dashboardModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(AppDimens.space15),
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Event List",
                  style: AppTextStyle.header,
                ),
                Text(
                  "See All",
                  style: AppTextStyle.header1,
                )
              ],
            ),
            SizedBox(
              height: AppDimens.space15,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 16 / 8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: dashboardModel.all_categories.length,
              itemBuilder: (context, index) {
                var item = dashboardModel.all_categories.elementAt(index);
                return AllEventCard(
                  text: item.category_name,
                  text2: '${item.total_events} events',
                  imgPath: '${item.image_path}',
                  color1: AppColors.colors[index % AppColors.colors.length],
                  color2:AppColors.colors[index % AppColors.colors.length].withOpacity(.2),
                );
              },
            ),
          ],
        ));
  }
}
