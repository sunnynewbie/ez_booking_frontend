import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/home/presentation/widget/all_event_card.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllEvent extends StatelessWidget {
  final DashboardModel dashboardModel;

  const AllEvent({super.key, required this.dashboardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.space12,
          vertical: AppDimens.space15,
        ),
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All Event List",
                  style: AppTextStyle.header,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.events);
                  },
                  child: const Text(
                    "See All",
                    style: AppTextStyle.header1,
                  ),
                )
              ],
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 16 / 8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: dashboardModel.all_categories.length,
              itemBuilder: (context, index) {
                var item = dashboardModel.all_categories.elementAt(index);
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.events, arguments: item.category_id);
                  },
                  child: AllEventCard(
                    text: item.category_name,
                    text2: '${item.total_events} events',
                    imgPath: '${item.image_path}',
                    color1: AppColors.colors[index % AppColors.colors.length],
                    color2: AppColors.colors[index % AppColors.colors.length]
                        .withOpacity(.1),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
