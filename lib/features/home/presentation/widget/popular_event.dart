import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularEvent extends StatelessWidget {
  final DashboardModel dashboardModel;

  const PopularEvent({super.key, required this.dashboardModel});

  @override
  Widget build(BuildContext context) {
    return dashboardModel.popular_events.isEmpty? SizedBox():Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.space12,
        vertical: AppDimens.space15,
      ),
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
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
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
                  totalReviews: 0,
                  rating: 0,
                  eventDate: item.event_date,
                  organizerName:
                      '${item.organizer?.f_name} ${item.organizer?.l_name}',
                ),
              );
            },
            itemCount: dashboardModel.popular_events.length,
          ),
        ],
      ),
    );
  }
}
