import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/features/events/controller/event_summery_args.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_booking_param.dart';
import 'package:get/get.dart';

class EventSummeryController extends GetxController {
  late Rx<EventModel> event;
  RxList<EventUser> users = RxList.empty();
  @override
  void onInit() {
    var args = Get.arguments as EventSummeryArgs;
    event = Rx(args.eventModel);
    users.assignAll(args.users);
    super.onInit();
  }

  createBooking() async {
    var user = PrefUtils().getUser();
    if (user != null) {
      var param = AddUserBookingParam(
          amount: event.value!.event_price.toDouble(),
          discount: 0,
          week_days: 'mon',
          event_id: event.value!.event_id.toInt(),
          user_id: user.id,
          booked_by_id: user.id,
          event_type: event.value!.event_type.toInt(),
          users: users.toList());
      var response = await ApiRepository().createOneTmeBooking(param);
      if (response.status) {
        Get.snackbar(AppConstant.appName, 'Booking completed');
        Get.toNamed(AppRoutes.homePage);
      } else {
        Get.snackbar(AppConstant.appName, response.message ?? '');
      }
    }
  }
}
