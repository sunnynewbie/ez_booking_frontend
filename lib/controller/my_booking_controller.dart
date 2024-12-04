import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxList<MyBookingModel> bookingList = RxList.empty();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getBookings();
    });
  }

  Future<void> getBookings() async {
    isLoading.value = true;
    var response = await ApiRepository().getBookings({});
    isLoading.value = false;
    if (response.status) {
      bookingList.assignAll(response.data ?? []);
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }
  }
}
