import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:get/get.dart';

class BookingDetailController extends GetxController {
  Rxn<BookingDetailModel> bookingDetail = Rxn();

  @override
  void onInit() {
    var args = Get.arguments as Booking_detailsBean;
    super.onInit();
    Future.delayed(Duration.zero,() {
      getBookingDetail(args.booking_id.toInt());
    });
  }

  Future<void> getBookingDetail(int id) async {
    var response = await ApiRepository().getSingleBooking(id: id);
    if (response.status && response.data != null) {
      bookingDetail.value = response.data;
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }
  }
}
