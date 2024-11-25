import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/features/events/services/event_services.dart';
import 'package:ez_booking/model/get_all_event.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  final EventService _eventService = EventService();
  var isLoading = true.obs;
  var eventList = <Event>[].obs;

  @override
  void onInit() {
    var id = Get.arguments as int;

    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getCategories(id);

    });
  }

  getCategories(int id) async {
    var query = {'event_type': id};
    var response = await ApiRepository().getCategoriesbyType(query);
  }
}
