import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:get/get.dart';

class UpcomingBookingController extends GetxController {
  RxList<MyBookingModel> bookings = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      getUpcomingBookings();
    });
  }

  Future<void> getUpcomingBookings() async {
    Map<String, dynamic> query = {'page': 1, 'limit': 10};
    var response = await ApiRepository().upcomingBookings(query: query);
    if (response.status) {
      bookings.assignAll(response.data ?? []);
    }
  }
}
