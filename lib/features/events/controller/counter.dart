import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for Counter Logic
class CounterController extends GetxController {
  var count = 0.obs; // Observable counter variable

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    }
  }
}
