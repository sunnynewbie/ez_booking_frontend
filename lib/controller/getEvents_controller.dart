import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var isLoading = false.obs; 
  var eventList = <EventModel>[].obs; 

  Future<void> fetchEventList(Map<String, dynamic>? requestData) async {
    isLoading.value = true; 
    var response = await ApiRepository().getEventList({}); 
    isLoading.value = false; 

    if (response.status) {
      eventList.value = response.data ?? []; 
    } else {
      ShowToast.showErrorMsg( response.message ?? 'Failed to Fetch Events');
    }
  }
}
