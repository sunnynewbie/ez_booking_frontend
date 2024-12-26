import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class ShowToast {
  static void showErrorMsg( message) {
    toastification.show(
      title: const Text("Error"),
      description: Text(message),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      style: ToastificationStyle.flatColored,
    );
  }
}
