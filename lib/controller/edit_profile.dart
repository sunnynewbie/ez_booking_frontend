import 'dart:developer';

import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ez_booking/core/api/api_repository.dart';

class UserFormController extends GetxController {
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  RxInt gender = 2.obs;

  int? userId;
  Rxn<UserModel> user = Rxn(); 

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      isLoading.value = true;
      var response = await ApiRepository().getUser({});
      isLoading.value = false;

      if (response.status) {
        userId = response.data?.id;
        nameController.text = response.data?.name ?? '';
        userNameController.text = response.data?.user_name ?? '';
        gender.value = response.data?.gender ?? 2;
      } else {
        Get.snackbar(
          'Error',
          'Failed to fetch user details: ${response.message ?? "Unknown Error"}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print("Error fetching user: $e");
    }
  }

  Future<void> submitForm() async {
    if (userId == null) {
      Get.snackbar(
        'Error',
        'User ID is not set. Cannot update user.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    log('User ID: $userId');
    log('Name: ${nameController.text.trim()}');
    log('Username: ${userNameController.text.trim()}');
    log('Gender: ${gender.value}');
    isLoading.value = true;
    log('entered');
    var response = await ApiRepository().editProfile(
      {
        "name": nameController.text.trim(),
        "gender": gender.value.toString(),
        "user_name": userNameController.text.trim(),
      },
    );
    

    log('entered2');
    isLoading.value = false;

    if (response.status) {
      Get.snackbar(
        'Success',
        'User edited successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      nameController.clear();
      userNameController.clear();
    } else {
      log(response.toString());
      log(response.status.toString());
      Get.snackbar(
        'Error',
        'Failed to update user: ${response.message ?? "Unknown Error"}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }
}
