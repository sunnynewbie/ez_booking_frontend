import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:ez_booking/model/booking_request_model.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:ez_booking/model/params/cancel_booking_request_param.dart';
import 'package:get/get.dart';

class BookingDetailController extends GetxController {
  Rxn<BookingRequestModel> bookingDetail = Rxn();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    var args = Get.arguments as num;
    super.onInit();
    Future.delayed(Duration.zero, () {
      getBookingDetail(args.toInt());
    });
  }

  Future<void> getBookingDetail(int id) async {
    isLoading.value = true;
    var response = await ApiRepository().getSingleBooking(id: id);
    if (response.status && response.data != null) {
      bookingDetail.value = response.data;
    } else {
      ShowToast.showErrorMsg(response.message ?? '');
    }
    isLoading.value = false;
  }

  Future<void> cancelBooking() async {
    CancelBookingParam cancelBookingParam = CancelBookingParam(
        id: bookingDetail.value!.id.toInt(),
        user_id: bookingDetail.value!.user.id);
    var response = await ApiRepository().cancelBookingRequest(cancelBookingParam);
    if(response.status){
      ShowToast.showMsg(response.message??'');
      bookingDetail.value!.status='cancel';
    }else{
      ShowToast.showErrorMsg(response.message??'');
    }
  }
}
