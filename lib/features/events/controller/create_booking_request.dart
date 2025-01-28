import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:get/get.dart';

class BookingRequestController extends GetxController {
  final _apiRepository = Get.find<ApiRepository>();
  final _isLoading = false.obs;
  
  bool get isLoading => _isLoading.value;

  Future<void> createBookingRequest(String eventId) async {
    try {
      _isLoading.value = true;
      
      final requestData = {
        'event_id': eventId,
      };

      final response = await _apiRepository.createBookingRequest(requestData);

      if (response.status) {
        Get.back();
        ShowToast.showMsg(response.message ?? "");
      } else {
       ShowToast.showErrorMsg(response.message ?? "");
      }
    } catch (e) {
      ShowToast.showMsg("Error");
    } finally {
      _isLoading.value = false;
    }
  }
}