import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var isLoading = true.obs;
  RxList<EventModel> events = RxList.empty();
  int page = 1;
  int limit = 10;

  @override
  void onInit() {
    var id = Get.arguments as int?;

    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getevents(id);
    });
  }

  getevents(int? id) async {
    isLoading.value=true;
    var query = {
      'page': page.toString(),
      'limit': limit.toString(),
    if(id!=null)  'category_id': id.toString(),
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
