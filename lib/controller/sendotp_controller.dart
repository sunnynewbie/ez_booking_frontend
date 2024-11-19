
import 'dart:developer';

import 'package:ez_booking/features/login/presentation/pages/verifiation_page.dart';
import 'package:ez_booking/model/login_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var userModel = Rxn<UserModel>();

  Future<void> loginUser(String phoneNumber) async {
    isLoading.value = true;
    final url = Uri.parse('https://ezbooking-node.onrender.com/v1/user/send-otp'); // Replace with actual API URL

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"phone_no": phoneNumber}),
      );

      if (response.statusCode == 200) {
        print(response.body.toString());
        userModel.value = UserModel.fromJson(json.decode(response.body));
        Get.to(() => VerificationPage(phoneNo: phoneNumber,)); 
      } else {
        Get.snackbar("Error", "Failed to send OTP. Please try again.");
      }
    } catch (e) {
      log("Exception : " + e.toString());
      // Get.snackbar("Error", "An error occurred.");
    } finally {
      isLoading.value = false;
    }
  }
}
