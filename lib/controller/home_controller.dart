import 'dart:developer';

import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/api/api_response.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/model/dashboard_cateogry_model.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);
  Rxn<DashboardModel> dashboard = Rxn();
  RxList<Category_typeBean> categories = RxList.empty();

  @override
  void onInit() {
    super.onInit();

  getHomeScreen();
  final userId = Appservice.instance.user.value?.id ?? 'null';
  log("Current user id: $userId");
  }

  getHomeScreen() {
    isLoading.value = true;
    Future.delayed(
      Duration.zero,
      () async {
        var response = await Future.wait([
          ApiRepository().getDashboardContent(),
          ApiRepository().getHomeCategory()
        ]);
        for (var item in response) {
          if (item is ApiResponse<DashboardModel?>) {
            dashboard.value = item.data;
          }
          if (item is ApiResponse<List<Category_typeBean>>) {
            categories.assignAll(item.data ?? []);
          }
        }
        isLoading.value = false;
      },
    );
  }
}
