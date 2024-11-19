import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:ez_booking/features/events/presentation/pages/event_detail_page.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EventController _controller = Get.put(EventController());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Camping Events',
          style: AppTextStyle.pagetitle,
        ),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_controller.eventList.isEmpty) {
          return const Center(
            child: Text('No events found'),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            // No fixed height for the GridView
            child: GridView.builder(
              shrinkWrap:
                  true,
              physics:
                  NeverScrollableScrollPhysics(), 
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              itemCount: _controller.eventList.length,
              itemBuilder: (ctx, i) {
                return Container(
                  // height: size.height * 0.7,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: InfoCard(
                            eventName: _controller.eventList[i].eventName ??
                                'Unamed title',
                            location: _controller.eventList[i].address ??
                                'Unamed address',
                            eventid: _controller.eventList[i].eventId ?? 0,
                            onPressed: () {
                              Get.to(() => EventDetailPage(
                                  eventId: _controller.eventList[i].eventId));
                            },
                          )),
                        ],
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: size.width * 0.02,
                mainAxisSpacing: size.width * 0.015,
                mainAxisExtent: 264,
              ),
            ),
          ),
        );
      }),
    );
  }
}
