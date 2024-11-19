
import 'dart:developer';

import 'package:ez_booking/model/get_all_event.dart';
import 'package:ez_booking/model/specific_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SpecificEventController extends GetxController {
  var event = Rxn<SpecificEvent>(); // Holds the event data
  var isLoading = false.obs; // Loading state

  // Method to fetch event details
  Future<void> fetchEventDetails(int id) async {
    try {
      isLoading(true);

      // Retrieve auth_token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString('auth_token');

      // API URL
      String url = 'https://ezbooking-node.onrender.com/v1/events/event/$id';

      // HTTP GET request with headers
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'token': authToken.toString(),
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          event.value = SpecificEvent.fromJson(responseData['data']);
        } else {
          Get.snackbar("Error", "Failed to fetch event details.");
        }
      } else {
        Get.snackbar("Error", "Server error: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
