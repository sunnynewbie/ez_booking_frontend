import 'package:ez_booking/model/order_model.dart';
import 'package:get/get.dart';

class EventOrderArgs {
  String orderStatus;
  List<OrderModel> bookings;

  EventOrderArgs({
    required this.orderStatus,
    required this.bookings,
  });
}

class EventOrderController extends GetxController {
  RxList<OrderModel> bookings = RxList.empty();
 late EventOrderArgs eventOrderArgs =EventOrderArgs(orderStatus: 'booked', bookings: bookings);
  @override
  void onInit() {
    eventOrderArgs = Get.arguments as EventOrderArgs;
    super.onInit();
    bookings.assignAll(eventOrderArgs.bookings);
  }


  bool get isBooked =>eventOrderArgs.orderStatus=='booked';
}
