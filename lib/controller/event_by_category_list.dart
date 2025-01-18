import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/model/dashboard_cateogry_model.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:get/get.dart';

class EventByCategoryListController extends GetxController {
  Rxn<Category_typeBean> currentCategory = Rxn();
  Rxn<AllCategoryBean> selectedCategory = Rxn();
  RxList<AllCategoryBean> categories = RxList.empty();
  RxList<EventModel> events = RxList.empty();
  RxBool isoading = RxBool(false);

  @override
  void onInit() {
    var category = Get.arguments as Category_typeBean;

    super.onInit();
    currentCategory.value = category;
    Future.delayed(Duration.zero, () async {
      await getCategories(category.event_type.toInt());
    });
  }

  getCategories(int id) async {
    isoading.value = true;
    var query = {
      'event_type': id.toString(),
      'city_id':Appservice.instance.user.value!.city?.city_id
    };
    var response = await ApiRepository().getCategoriesbyType(query);
    if (response.data != null) {
      categories.assignAll(response.data ?? []);
      if(categories.isNotEmpty) {
        selectedCategory.value = categories.first;

        getEventsByCategory();
      }else{
        isoading.value=false;
      }
    }
  }

  getEventsByCategory() async {
    isoading.value = true;
    events.clear();
    var response = await ApiRepository().getEventList({
      "page": "1",
      "limit": '10',
      'city_id': Appservice.instance.user?.value?.city?.city_id,
      "category_id": selectedCategory.value!.category_id.toString()
    });
    if (response.status) {
      events.assignAll(response.data ?? []);
    }
    isoading.value = false;
  }
}
