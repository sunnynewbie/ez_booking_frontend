import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:get/get.dart';

class AllBookingController extends GetxController {
  RxList<MyBookingModel> bookingList = RxList.empty();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      getBookings();
    });
  }

  Future<void> getBookings() async {
    isLoading.value = true;
    var response = await ApiRepository().getBookings({});
    isLoading.value = false;
    if (response.status) {
      bookingList.assignAll(response.data ?? []);
    } else {
      ShowToast.showErrorMsg( response.message ?? '');
    }
  }
}
