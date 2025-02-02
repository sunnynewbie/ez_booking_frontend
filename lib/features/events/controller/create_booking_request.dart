import 'package:ez_booking/core/api/api_repository.dart';
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