import 'dart:convert';
import 'dart:developer';

import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/specific_event.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SpecificEventController extends GetxController {
  var event = Rxn<EventModel>(); // Holds the event data
  var isLoading = false.obs; // Loading state

  // Method to fetch event details
  Future<void> fetchEventDetails(int id) async {
    var response =await ApiRepository().getEventBYId(id: id);

    if(response.status){
      event.value=response.data;
    }
  }

  @override
  void onInit() {
    var event_id = Get.arguments as int;
    super.onInit();
    Future.delayed(Duration.zero, () {
      fetchEventDetails(event_id);
    });
  }
}
