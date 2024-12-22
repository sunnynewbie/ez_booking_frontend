import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:ez_booking/features/events/pages/event_detail_page.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
      builder: (ctrl) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Events',
            style: AppTextStyle.pagetitle,
          ),
        ),
        body: Obx(() {
          if (ctrl.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (ctrl.events.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.space16,
                vertical: AppDimens.space20,
              ),
              physics: ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: ctrl.events.length,
              itemBuilder: (context, index) {
                var event = ctrl.events.elementAt(index);
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.eventDetail,
                        arguments: event.event_id.toInt());
                  },
                  child: InfoCard(
                    eventid: event.event_id.toInt(),
                    location: event.address,
                    eventName: event.event_name,
                    eventDate: event.event_date,
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('No events found'),
          );
        }),
      ),
    );
  }
}
