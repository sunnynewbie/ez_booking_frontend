import 'dart:developer';

import 'package:get/get.dart';
import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/model/dashboard_model.dart';

class ExploreController extends GetxController {
  RxList<dynamic> events = RxList<dynamic>.empty();
  RxList<AllCategoryBean> categories = RxList<AllCategoryBean>.empty();
  Rxn<AllCategoryBean> selectedCategory = Rxn<AllCategoryBean>();
  RxBool isoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getCategories();
      await getEventsByCategory();
      
    });
        log("CAT "+categories.toString());

  }
getCategories() async {
    isoading.value = true;
    var query = {
      'city_id':Appservice.instance.user.value!.city?.city_id
    };
    var response = await ApiRepository().getCategoriesbyType(query);
    if (response.data != null) {
      categories.assignAll(response.data ?? []);
      selectedCategory.value = categories.first;
      getEventsByCategory();
    }
  }

  getEventsByCategory() async {
    isoading.value = true;
    events.clear();
    var response = await ApiRepository().getEventList({
      "page": "1",
      "limit": '10',
      'city_id': Appservice.instance.user.value?.city?.city_id,
    });
    if (response.status) {
      events.assignAll(response.data ?? []);
    }
    isoading.value = false;
  }
}