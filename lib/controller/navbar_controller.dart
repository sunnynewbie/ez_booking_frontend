import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/api/api_response.dart';
import 'package:ez_booking/model/dashboard_cateogry_model.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxInt tabIndex = 0.obs;
   @override
   void onInit() {
    super.onInit();
    print("NavBarController initialized");
  }
  void changeTabIndex(int index){
    tabIndex.value = index;

  }

}
