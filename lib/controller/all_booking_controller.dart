import 'dart:developer';

import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/booking_request_model.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:ez_booking/model/params/booking_request_param.dart';
import 'package:get/get.dart';

class AllBookingController extends GetxController {
  RxList<BookingRequestModel> bookingList = RxList.empty();
  RxBool isLoading = RxBool(false);
  int page = 1;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      getBookings();
    });
  }

  Future<void> getBookings() async {
    if (page == 1) {
      isLoading.value = true;
    }
    BookingRequestparam param = BookingRequestparam(
        userId: Appservice.instance.user.value!.id, page: page, limit: limit);
    var response = await ApiRepository().getBookingsRequest(param);
    print("REUESYETSSSS : " + response.data.toString());
    isLoading.value = false;
    if (response.status) {
      if (page == 1) {
        bookingList.assignAll(response.data ?? []);
      } else {
        bookingList.addAll(response.data ?? []);
      }
    } else {
      ShowToast.showErrorMsg(response.message ?? '');
    }
  }
}
