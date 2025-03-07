import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var isLoading = true.obs;
  RxList<EventModel> events = RxList.empty();
  int page = 1;
  int limit = 10;
  int? categoryId;
  @override
  void onInit() {
    categoryId = Get.arguments as int?;

    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getevents(categoryId);
    });
  }

  getevents(int? id) async {
    if(page==1) {
      isLoading.value=true;
    }
    var query = {
      'page': page.toString(),
      'limit': limit.toString(),
    if(categoryId!=null)  'category_id': categoryId.toString(),
    'city_id': Appservice.instance.user.value!.city!.city_id,
    };
    var response = await ApiRepository().getEventList(query);
    isLoading.value=false;
    if (response.status) {
      if (page == 1) {
        events.assignAll(response.data ?? []);
      } else {
        events.addAll(response.data ?? []);
      }
    }
  }
}
