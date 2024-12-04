import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:ez_booking/controller/my_booking_controller.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBooking extends StatelessWidget {
  const MyBooking({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ['All', 'Upcoming', 'Cancel', 'Past'];

    return GetBuilder(
      init: MyBookingController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Booking',
            style: TextStyle(color: Colors.black),
          ),
          bottom: ButtonsTabBar(
            controller: _.tabController,
            width: 120,
            center: false,
            contentCenter: true,
            height: 45,
            buttonMargin:
                const EdgeInsets.symmetric(horizontal: AppDimens.space10),
            labelStyle: context.md14.withWhite,
            backgroundColor: AppColors.primary,
            unselectedLabelStyle: context.md14.withgrey78,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Cancel'),
            ],
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
              color: Colors.black), // For back button color.
        ),
        body: TabBarView(
          controller: _.tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Obx(
              () => BookingListWidget(
                bookings: _.bookingList.toList(),
              ),
            ),
            Obx(
              () => BookingListWidget(
                bookings: _.bookingList.toList(),
              ),
            ),
            Obx(
              () => BookingListWidget(
                bookings: _.bookingList.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
