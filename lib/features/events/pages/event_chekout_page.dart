import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/events/controller/event_summery_args.dart';
import 'package:ez_booking/features/events/controller/event_upate_user_controller.dart';
import 'package:ez_booking/features/events/pages/add_user_event_page.dart';
import 'package:ez_booking/model/event_days.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCheckoutPage extends StatelessWidget {
  const EventCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventUpdateUserController>(
      init: EventUpdateUserController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          title: Text(
            'Booking details (Users)',
            style: context.lg16.weigh500,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.space16),
          child: AddUserEventPage(
            param: _.param,
            onContinue: () {
              Get.toNamed(AppRoutes.eventSummeryPage,
                  arguments: EventSummeryArgs(eventModel: _.eventModel!, users: _.users.toList()));
            },
          ),
        ),
      ),
    );
  }
}
