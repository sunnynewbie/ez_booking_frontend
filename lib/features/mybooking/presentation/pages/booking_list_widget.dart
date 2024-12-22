import 'package:ez_booking/controller/all_booking_controller.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingListWidget extends StatelessWidget {
  const BookingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AllBookingController(),
      builder: (_) => RefreshIndicator(
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
