import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/features/events/controller/regular_checkout_controller.dart';
import 'package:ez_booking/model/event_days.dart';
import 'package:ez_booking/model/event_time_slot_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventSelectTimeslotScreen extends StatelessWidget {
  final List<EventDays> eventDays;
  final List<EventTimeSlotModel> timeSlots;
  final VoidCallback onContinue;
  final EventTimeSlotModel? selectedItem;
  final List<EventDays> days;

  const EventSelectTimeslotScreen({
    super.key,
    required this.eventDays,
    required this.timeSlots,
    required this.onContinue,
    this.selectedItem,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegularChecoutController>(
      init: Get.find<RegularChecoutController>(),
      builder: (_) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(AppDimens.space20),
            Text(
              'Select Date',
              style: context.lg16.weigh500,
            ),
            Gap(AppDimens.space15),
            Wrap(
              spacing: AppDimens.space10,
              runSpacing: AppDimens.space15,
              children: eventDays.map(
                (e) {
                  var selected = days.contains(e);
                  return AppElevatedButton(
                      borderColor:
                          selected ? AppColors.primary : AppColors.borderColor,
                      buttonColor: selected ? AppColors.primary : Colors.white,
                      fontColor: selected ? Colors.white : AppColors.primary,
                      onTap: () {
                        if (_.selectDays.contains(e)) {
                          _.selectDays.remove(e);
                        } else {
                          _.selectDays.add(e);
                        }
                      },
                      text: e.label);
                },
              ).toList(),
            ),
            Gap(AppDimens.space20),
            Text(
              'Time',
              style: context.lg16.weigh500,
            ),
            Gap(AppDimens.space15),
            Wrap(
              spacing: AppDimens.space10,
              runSpacing: AppDimens.space15,
              children: timeSlots.map((e) {
                var selected = selectedItem == e;
                return AppElevatedButton(
                  onTap: () {
                    _.selectedTime.value = e;
                  },
                  borderColor:
                      selected ? AppColors.primary : AppColors.borderColor,
                  buttonColor: selected ? AppColors.primary : Colors.white,
                  fontColor: selected ? Colors.white : AppColors.primary,
                  text: "${e.start_time}-${e.end_time}",
                );
              }).toList(),
            ),
            Spacer(),
            AppElevatedButton(
              onTap: onContinue,
              text: 'Continue',
              width: double.maxFinite,
            ),
            Gap(AppDimens.space20),
          ],
        ),
      ),
    );
  }
}
