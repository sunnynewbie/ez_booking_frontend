import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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
            return SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,  
             onLoading: () async {
                ctrl.page++;  
                await Future.delayed(Duration(milliseconds: 1000));
                ctrl.isLoading = false.obs;
                await ctrl.getevents(null); 
                _refreshController.loadComplete();
              },
              
              
              child: GridView.builder(
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
              ),
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
