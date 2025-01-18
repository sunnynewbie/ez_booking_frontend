import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EventUpdateUserController extends GetxController {
  RxList<EventUser> users = RxList.empty();
  EventModel? eventModel;
  var formKey = GlobalKey<FormState>();
  late AddUserParam param;
  @override
  void onInit() {
    var args = Get.arguments as AddUserParam;
    param=args;
    super.onInit();
    users.assignAll(args.users);
    eventModel = args.eventModel;
    update();
  }
}
