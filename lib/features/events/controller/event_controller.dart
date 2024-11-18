import 'dart:developer';

import 'package:ez_booking/features/events/services/event_services.dart';
import 'package:ez_booking/model/get_all_event.dart';
import 'package:get/get.dart';


class EventController extends GetxController {
  final EventService _eventService = EventService();
  var isLoading = true.obs;
  var eventList = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
     log('EventController initialized');
    fetchEvents();
  }

  void fetchEvents() async {
    log('Fetching events...');
    try {
      isLoading(true);
      final events = await _eventService.fetchEvents();
      eventList.assignAll(events);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
