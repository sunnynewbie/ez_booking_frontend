import 'package:ez_booking/controller/event_summery_controller.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/events/widget/booking_event_item.dart';
import 'package:ez_booking/features/events/widget/event_summery_widget.dart';
import 'package:ez_booking/features/events/widget/event_user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventCheckoutSummeryPage extends StatelessWidget {
  const EventCheckoutSummeryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EventSummeryController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          title: Text(
            'Event summery',
            style: context.lg16.weigh500,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppDimens.space15),
              BookingEventItem(
                eventTitle: _.event.value.event_name,
              eventAddress: _.event.value.address,
                eventImage: '',
                evetnDate: _.event.value.event_date,
              ),
              EventSummeryWidget(
                title: 'Booking details',
                content: [
                  RowContent(
                      title: 'Duration',
                      content: _.event.value.dateStr,
                      titleStyle: context.md14.withgrey78,
                      contentStyle: context.lg16.weigh500),
                  RowContent(
                      title: 'Location',
                      content: _.event.value.address,
                      titleStyle: context.md14.withgrey78,
                      contentStyle: context.lg16.weigh500),
                  RowContent(
                      title: 'Time',
                      content: _.event.value.event_date!.toIso8601String(),
                      titleStyle: context.md14.withgrey78,
                      contentStyle: context.lg16.weigh500)
                ],
              ),
              Gap(AppDimens.space15),
              EventUserListWidget(
                users: _.users.toList(),
              ),
              EventSummeryWidget(
                title: 'Price details',
                content: [
                  RowContent(
                      title: 'Subtotal',
                      content: '',
                      titleStyle: context.md14.withgrey78,
                      contentStyle: context.md14.withgrey78),
                  RowContent(
                      title: 'Tax',
                      content: '',
                      titleStyle: context.md14.withgrey78,
                      contentStyle: context.md14.withgrey78),
                  RowContent(
                      title: 'Grand Total',
                      content: '',
                      titleStyle: context.lg16.weigh500,
                      contentStyle: context.lg16.weigh500)
                ],
              ),
              Gap(AppDimens.space30),
              AppElevatedButton(
                width: double.maxFinite,
                text: 'Continue to payment',
                onTap: () {
                  _.createBooking();
                },
              ),
              Gap(AppDimens.space20),
            ],
          ),
        ),
      ),
    );
  }
}
