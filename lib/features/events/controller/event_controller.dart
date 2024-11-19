import 'dart:developer';
import 'package:ez_booking/features/events/services/event_services.dart';
import 'package:ez_booking/model/get_all_event.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // Fetch token from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');  // assuming the token is saved with the key 'token'
      log('On Event Controller - ' + token.toString());
      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Token not found');
        return;
      }

      isLoading(true);
      final events = await _eventService.fetchEvents(token);  // Pass token to the service method
      eventList.assignAll(events);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
