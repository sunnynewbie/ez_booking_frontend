import 'dart:convert';
import 'dart:developer';

import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/params/update_user_param.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ez_booking/core/api/api_repository.dart';

class UserFormController extends GetxController {
  final nameController = TextEditingController();
  final fNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final lNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final userNameController = TextEditingController();
  RxnInt gender = RxnInt();
  Rxn<DateTime> dob = Rxn();
  int? userId;
  Rxn<UserModel> user = Rxn();
  var formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      isLoading.value = true;
      var user = PrefUtils().getUser();
      var response = await ApiRepository().getUser();
      isLoading.value = false;
      log(jsonEncode(response.data));
      if (response.status) {
        userId = response.data?.id;
        fNameCtrl.text = response.data?.f_name ?? '';
        lNameCtrl.text = response.data?.l_name ?? '';
        dobCtrl.text = response.data?.dob ?? '';
        userNameController.text = response.data?.user_name ?? '';
        emailCtrl.text = response.data?.email ?? '';
        gender?.value = response.data?.gender ?? 2;
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
    var param = UpdateUserParam(
      f_name: fNameCtrl.text.trim(),
      l_name: lNameCtrl.text.trim(),
      user_name: userNameController.text.trim(),
      gender: gender.value,
      dob: dob.value,
      email: emailCtrl.text.trim(),
    );

    isLoading.value = true;
    var response = await ApiRepository().editProfile(param: param);
    isLoading.value = false;

    if (response.status) {
      var result = response.data;
      await PrefUtils().setUser(result!);
    } else {}
  }
}
