import 'package:ez_booking/core/config/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class ShowToast {
  static void showErrorMsg( message) {
    Toastification().show(
      context: Get.context,
      title: const Text(AppConstant.appName),
      description: Text(message),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 200),
      style: ToastificationStyle.flatColored,
    );
  }
  static void showMsg( message) {
    Toastification().show(
      context: Get.context,
      title: const Text(AppConstant.appName),
      description: Text(message),
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 200),
      style: ToastificationStyle.flatColored,
    );
  }
}
