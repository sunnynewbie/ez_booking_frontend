import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:ez_booking/controller/my_booking_controller.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_list_widget.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/upcoming_bookings_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBooking extends StatelessWidget {
  const MyBooking({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: MyBookingController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          title: Text(
            'My Reviews',
            style: context.lg16.weigh500,
          ),
          titleSpacing: 10,
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
            tabs: const [
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
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            BookingListWidget(),
            UpcomingBookingsList(),
            BookingListWidget(),
          ],
        ),
      ),
    );
  }
}
