import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_booking_param.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EventUpdateUserController extends GetxController {
  RxList<EventUser> users = RxList.empty();
  EventModel? eventModel;
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    var args = Get.arguments as AddUserParam;
    super.onInit();
    users.assignAll(args.users);
    eventModel = args.eventModel;
    update();
  }

  createBooking() async {
    var user = PrefUtils().getUser();
    if (user != null) {
      var param = AddUserBookingParam(
        amount: num.parse(eventModel!.event_price).toDouble(),
          discount: num.parse(eventModel!.event_price).toDouble(),
          week_days: 'mon',
          event_id: eventModel!.event_id.toInt(),
          user_id: user.id,
          booked_by_id: user.id,
          event_type: eventModel!.event_type.toInt(),
          users: users.toList());
      var response = await ApiRepository().createOneTmeBooking(param);
      if (response.status) {
        Get.toNamed(RouteConfig.loadingpage);
      } else {
        Get.snackbar(AppConstant.appName, response.message ?? '');
      }
    }
  }
}
