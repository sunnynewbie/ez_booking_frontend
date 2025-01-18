import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ExploreController extends GetxController {
  RxList<EventModel> events = RxList.empty();
  RxList<AllCategoryBean> categories = RxList<AllCategoryBean>.empty();
  Rxn<AllCategoryBean> selectedCategory = Rxn<AllCategoryBean>();
  RxBool isoading = RxBool(false);
  int page = 1;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getCategories();
    });
  }

  getCategories() async {
    isoading.value = true;
    var query = {'city_id': Appservice.instance.user.value!.city?.city_id};
    var response = await ApiRepository().exploreCategories(query);
    if (response.data != null) {
      categories.assignAll(response.data ?? []);
      selectedCategory.value = categories.first;
      getEventsByCategory();
    }
  }

  getEventsByCategory() async {
    if (page == 1) {
      isoading.value = true;
      events.clear();
    }
    var response = await ApiRepository().getEventList({
      "page": page,
      "limit": '10',
      'city_id': Appservice.instance.user.value?.city?.city_id,
      if (selectedCategory.value!.category_id != 0)
        "category_id": selectedCategory.value!.category_id.toString()
    });
    if (response.status) {
      if (page == 1) {
        events.assignAll(response.data ?? []);
      } else {
        events.addAll(response.data ?? []);
      }
    }
    isoading.value = false;
  }
}
