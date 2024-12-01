import 'dart:developer';

import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/api/api_response.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool isLoading = RxBool(false); // To manage the loading state
  Rxn<UserModel> user = Rxn(); // To hold the user data
  
  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data on controller initialization
  }

  Future<void> fetchUserData() async {
    isLoading.value = true; // Set loading state to true
    try {
      var response = await ApiRepository().getUser({}); // API call to fetch user data
      if (response is ApiResponse<UserModel?>) {
        log(response.toString());
        user.value = response.data; // Assign the fetched user data
      }
    } catch (e) {
      // Handle errors
      print('Error fetching user data: $e');
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }
}
