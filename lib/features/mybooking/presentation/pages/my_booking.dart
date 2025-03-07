import 'package:ez_booking/controller/my_booking_controller.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_list_widget.dart';
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
            'My Request',
            style: context.lg16.weigh500,
          ),
          titleSpacing: 10,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
              color: Colors.black), // For back button color.
        ),
        body: BookingListWidget(),
      ),
    );
  }
}
