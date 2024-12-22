import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/features/events/pages/regular_checkout_page.dart';
import 'package:ez_booking/model/event_days.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_time_slot_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegularChecoutController extends GetxController {
  Rxn<EventModel> event = Rxn();
  RxList<EventTimeSlotModel> timeslots = RxList.empty();
  List<EventUser> users = [];
  RxBool isLoading = RxBool(false);
  RxInt currentStep = RxInt(1);
  RxList<EventDays> selectDays = RxList.empty();
  Rxn<EventTimeSlotModel> selectedTime = Rxn();
  PageController pageController = PageController();

  @override
  void onInit() {
    var event = Get.arguments as RegularCheckoutArgs;
    super.onInit();
    isLoading.value = true;
    users = event.users;
    this.event.value = event.eventModel;
    Future.delayed(0.seconds, () async {
      await getTimeSlots();
    });
  }

  Future<void> getTimeSlots() async {
    isLoading.value = true;

    var response =
        await ApiRepository().getTimeSlots(event.value!.event_id.toInt());
    if (response.status) {
      timeslots.assignAll(response.data ?? []);
    }

    isLoading.value = false;
  }
}
