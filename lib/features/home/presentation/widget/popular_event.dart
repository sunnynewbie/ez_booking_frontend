import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PopularEvent extends StatelessWidget {
  final DashboardModel dashboardModel;

  const PopularEvent({super.key, required this.dashboardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.all(AppDimens.space15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular Events",
                style: AppTextStyle.header,
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.events),
                child: const Text(
                  "See All",
                  style: AppTextStyle.header1,
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.height * .32,
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Gap(AppDimens.space15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = dashboardModel.popular_events.elementAt(index);
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.eventDetail,
                        arguments: item.event_id);
                  },
                  child: InfoCard(
                    eventid: item.event_id.toInt(),
                    eventName: item.event_name,
                    location: item.address,
                    rating: 0,
                    eventDate: item.event_date,
                  ),
                );
              },
              itemCount: dashboardModel.popular_events.length,
            ),
          ),
        ],
      ),
    );
  }
}
