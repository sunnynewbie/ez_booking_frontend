import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_icon_button.dart';
import 'package:ez_booking/features/events/controller/event_summery_args.dart';
import 'package:ez_booking/features/events/controller/regular_checkout_controller.dart';
import 'package:ez_booking/features/events/pages/add_user_event_page.dart';
import 'package:ez_booking/features/events/pages/event_select_timeslot_screen.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class RegularCheckoutArgs {
  EventModel eventModel;
  List<EventUser> users;

  RegularCheckoutArgs({
    required this.eventModel,
    required this.users,
  });
}

class RegularCheckoutpage extends StatelessWidget {
  const RegularCheckoutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegularChecoutController(),
      builder: (_) => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text('Booking'),
            leading: AppIconButton(
              child: Icon(Icons.keyboard_backspace_rounded),
              onPressed: () {
                if (_.currentStep.value == 0) {
                  Get.back();
                  return;
                }
                _.pageController
                    .previousPage(duration: 300.ms, curve: Curves.linear);
              },
            ),
          ),
          body: _.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.space16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          StepperItem(
                            label: '1',
                            selected: _.currentStep.value == 0,
                          ),
                          Expanded(
                            child: Divider(
                              height: 0,
                            ),
                          ),
                          StepperItem(
                            label: '2',
                            selected: _.currentStep.value == 1,
                          ),
                        ],
                      ),
                      Expanded(
                        child: PageView(
                          controller: _.pageController,
                          onPageChanged: (value) {
                            _.currentStep.value = value;
                          },
                          children: [
                            Obx(
                              () => EventSelectTimeslotScreen(
                                eventDays: _.event.value!.event_days!,
                                timeSlots: _.timeslots.toList(),
                                days: _.selectDays.toList(),
                                selectedItem: _.selectedTime.value,
                                onContinue: () {
                                  if (_.selectedTime.value == null ||
                                      _.selectDays.isEmpty) {
                                    Get.snackbar(AppConstant.appName,
                                        'Please select timings.',
                                        colorText: Colors.white,
                                        borderRadius: 10,
                                        backgroundColor: AppColors.primary,
                                        margin: const EdgeInsets.only(
                                            left: AppDimens.space10,
                                            right: AppDimens.space10,
                                            bottom: AppDimens.space20),
                                        snackPosition: SnackPosition.BOTTOM);
                                    return;
                                  }
                                  _.pageController.nextPage(
                                      duration: 300.ms, curve: Curves.linear);
                                },
                              ),
                            ),
                            AddUserEventPage(
                              param: AddUserParam(
                                eventModel: _.event.value!,
                                users: _.users.toList(),
                              ),
                              onContinue: () {
                                Get.toNamed(AppRoutes.eventSummeryPage,
                                    arguments: EventSummeryArgs(
                                        days: _.selectDays.toList(),
                                        selectedTime: _.selectedTime.value,
                                        eventModel: _.event.value!,
                                        users: _.users.toList()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class StepperItem extends StatelessWidget {
  final String label;
  final bool selected;

  const StepperItem({super.key, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.space30,
      width: AppDimens.space30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: selected ? AppColors.primary : Colors.white,
        border: Border.all(color: AppColors.grey78),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: context.md14
            .copyWith(color: selected ? Colors.white : AppColors.primary),
        textAlign: TextAlign.center,
      ),
    );
  }
}
