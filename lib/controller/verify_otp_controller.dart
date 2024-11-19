import 'dart:developer';

import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/login/service/verify_otp_service.dart';
import 'package:ez_booking/model/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController {
  final ApiService _apiService = ApiService();
  RxString otpString = ''.obs;
  RxBool isLoading = false.obs; // Loading state

  Future<void> verifyOtp(String otp, String phoneNo) async {
    isLoading.value = true; // Start loading
    try {
      // Call the API
      final ApiResponse response = await _apiService.verifyOtp(otp, phoneNo);

      // Check if status is true and data exists
      if (response.status == true && response.data != null) {
        final userData = response.data!;

        // Save data in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', userData.name ?? ''); // Handle nullable name
        await prefs.setString('phone_no', userData.phoneNo);
        await prefs.setBool('isLoggedIn', true);
        String? token = response.token; // Assuming token is returned in the response header
        log("Token - " + token!);
        if (token != null) {
          await prefs.setString('auth_token', token); // Save the token
        }
        // Navigate to HomePage
        Get.offAll(() => HomePage());
      } else {
        // Handle invalid response
        Get.snackbar('Error', response.message ?? 'OTP verification failed');
      }
    } catch (error) {
      // Handle errors
      Get.snackbar('Error', 'Something went wrong: $error');
      print(error.toString());
    } finally {
      isLoading.value = false; 
    }
  }
}
