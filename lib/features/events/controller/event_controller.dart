import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/features/events/services/event_services.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/get_all_event.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var isLoading = true.obs;
  RxList<EventModel> events=RxList.empty();

  @override
  void onInit() {
    var id = Get.arguments as int;

    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getCategories(id);

    });
  }

  getCategories(int id) async {
    var data = {'event_id': id};
    var response = await ApiRepository().getEventBYId(id: id);
  }
}
