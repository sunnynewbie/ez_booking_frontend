import 'package:ez_booking/controller/upcoming_booking_controller.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingBookingsList extends StatelessWidget {
  const UpcomingBookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UpcomingBookingController(),
      builder: (_) => Scaffold(
        // body: Obx(
        //   () => BookingList(
        //     bookings: _.bookings.toList(),
        //   ),
        // ),
      ),
    );
  }
}
