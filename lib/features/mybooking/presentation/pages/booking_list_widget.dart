import 'package:ez_booking/controller/all_booking_controller.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class BookingListWidget extends StatelessWidget {
  const BookingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
      RefreshController(initialRefresh: false);
    return GetBuilder(
      init: AllBookingController(),
      builder: (_) =>  SmartRefresher(
         controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,  
          onLoading: () async {
            _.page++;  
            await Future.delayed(Duration(milliseconds: 1000));
            _.isLoading = false.obs;
            await _.getBookings(); 
            _refreshController.loadComplete();
        },
        onRefresh: () async {
          await _.getBookings();
        },
        child: Obx(
            () => BookingList(
              bookings: _.bookingList.toList(),
            ),
          ),
      ),
      
    );
  }
}