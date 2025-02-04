import 'package:ez_booking/controller/event_service_with_id.dart';
import 'package:ez_booking/controller/event_summery_controller.dart';
import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/extension/common_extension.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:get/get.dart';

class BookingRequestController extends GetxController {
  final isLoading = false.obs;
  

  Future<void> createBookingRequest(String eventId) async {
    try {
      isLoading.value = true;
      
      final requestData = {
        'event_id': eventId,
      };
      final response = await ApiRepository().createBookingRequest(requestData);
      if (response.status) {
        Get.find<EventDetailController>().fetchEventDetails(eventId.toInt);
        ShowToast.showNormalPopUp(response.message ?? "");
      } else {
       ShowToast.showNormalPopUp(response.message ?? "");
      }
    } catch (e) {
      ShowToast.showMsg("Error");
    } finally {
      isLoading.value = false;
    }
  }
}