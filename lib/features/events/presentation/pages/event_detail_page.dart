import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:ez_booking/features/events/controller/image_widget.dart';
import 'package:ez_booking/features/events/services/event_service_with_id.dart';
import 'package:ez_booking/features/events/widget/image_widget.dart';
import 'package:ez_booking/features/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Main EventDetailPage Widget
class EventDetailPage extends StatelessWidget {
  final int? eventId;
  const EventDetailPage({super.key, this.eventId});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Instantiate the controllers
    final ImageController controller = Get.put(ImageController());
    final SpecificEventController eventController =
        Get.put(SpecificEventController());
    if (eventId != null) {
      eventController.fetchEventDetails(eventId!);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Column(
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
                      ImageChangerWidget(controller: controller),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: size.width * 0.9,
                        padding: EdgeInsets.all(size.width * 0.03),
                        margin: EdgeInsets.all(size.width * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black26, width: 1.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Details',
                              style: AppTextStyle.pagetitle,
                            ),
                            SizedBox(height: size.height * 0.02),
                            Text(event.address.toString(),
                                style: AppTextStyle.regular2),
                            Text("Latitude: ${event.latitude}",
                                style: AppTextStyle.regular2),
                            Text("Longitude: ${event.longitude}",
                                style: AppTextStyle.regular2),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
          // Bottom Container with Price and Button
          Container(
            height: size.height * 0.1,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.02),
            decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.black26, width: 1.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Price
                Obx(() {
                  if (eventController.event.value != null) {
                    return Text(
                      "\₹ ${eventController.event.value!.eventPrice}",
                      style: AppTextStyle.pagetitle,
                    );
                  } else {
                    return const Text("Price not available");
                  }
                }),
                // Buy Now Button
                CustomButtom(
                    text: "Buy Now",
                    height: size.height * 0.08,
                    width: size.width * 0.5)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
