import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/controller/counter.dart';
import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:ez_booking/features/events/controller/image_widget.dart';
import 'package:ez_booking/features/events/services/event_service_with_id.dart';
import 'package:ez_booking/features/events/widget/event_details_field.dart';
import 'package:ez_booking/features/events/widget/expanded_container.dart';
import 'package:ez_booking/features/events/widget/hashtag.dart';
import 'package:ez_booking/features/events/widget/image_widget.dart';
import 'package:ez_booking/features/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final List<String> items = ['travel', 'fun', 'trip'];
    final RxBool isExpanded = false.obs;

    return Scaffold(
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
                          ImageChangerWidget(controller: controller),
                          HorizontalTextDisplay(
                            items: items,
                            eventName: event.eventName.toString(),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.9,
                            padding: EdgeInsets.all(size.width * 0.02),
                            margin: EdgeInsets.all(size.width * 0.05),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: Colors.black12, width: 1.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Event Details',
                                  style: AppTextStyle.header,
                                ),
                                SizedBox(height: size.height * 0.01),
                                EventDetailsField(
                                    title: 'Date', text: '17 Oct, 2024'),
                                SizedBox(height: size.height * 0.01),
                                EventDetailsField(
                                    title: 'Time', text: '09:30 AM'),
                                SizedBox(height: size.height * 0.01),
                                EventDetailsField(
                                  title: 'Language',
                                  text: 'English, Hindi, Bengali',
                                ),
                                SizedBox(height: size.height * 0.01),
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

          // GestureDetector to handle taps outside the container
          GestureDetector(
            onTap: () {
              if (isExpanded.value) isExpanded.value = false;
            },
            child: Container(
              color: isExpanded.value ? Colors.black54 : Colors.transparent,
            ),
          ),

          // Bottom Container with Expandable Functionality
          Obx(() {
            return Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height:
                    isExpanded.value ? size.height * 0.3 : size.height * 0.09,
                width: double.infinity,
                padding: isExpanded.value
                    ? EdgeInsets.zero // No padding if expanded
                    : EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.02,
                      ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(0, -1), // Shadow above the container
                      blurRadius: 6,
                    ),
                  ],
                  border: const Border(
                    top: BorderSide(color: Colors.black26, width: 1.2),
                  ),
                ),
                child: isExpanded.value
                    ? Stack(
                        children: [
                          // Expanded Content

                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: ExpandedContainer()),

                          // Close Button
                          // Positioned(
                          //   top: 8,
                          //   right: 8,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       isExpanded.value = false;
                          //     },
                          //     child: const Icon(Icons.close, size: 24),
                          //   ),
                          // ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                          GestureDetector(
                            onTap: () {
                              isExpanded.value = true; // Expand the container
                            },
                            child: CustomButtom(
                              text: "Buy Now",
                              height: size.height * 0.08,
                              width: size.width * 0.5,
                            ),
                          ),
                        ],
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
