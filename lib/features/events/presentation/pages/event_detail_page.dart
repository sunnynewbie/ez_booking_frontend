import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/services/event_service_with_id.dart';
import 'package:ez_booking/features/events/widget/event_details_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecificEventController>(
      init: SpecificEventController(),
      builder: (eventController) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Event Details',
            style: AppTextStyle.pagetitle,
          ),
        ),
        body: Stack(
          children: [
            // Main Content
            Column(
              children: [
                Expanded(
                  child: Obx(() {
                    if (eventController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (eventController.event.value == null) {
                      return const Center(
                        child: Text("No event details available."),
                      );
                    } else {
                      final event = eventController.event.value!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // ImageChangerWidget(controller: controller),
                            // HorizontalTextDisplay(
                            //   items: items,
                            //   eventName: event.eventName.toString(),
                            // ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Colors.black12, width: 1.2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Event Details',
                                    style: AppTextStyle.header,
                                  ),
                                  Gap(AppDimens.space15),
                                  EventDetailsField(
                                      title: 'Date', text: '17 Oct, 2024'),
                                  Gap(AppDimens.space15),
                                  EventDetailsField(
                                      title: 'Time', text: '09:30 AM'),
                                  Gap(AppDimens.space15),
                                  EventDetailsField(
                                    title: 'Language',
                                    text: 'English, Hindi, Bengali',
                                  ),
                                  Gap(AppDimens.space15),
                                  EventDetailsField(
                                      title: 'Duration', text: '3 Days'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
