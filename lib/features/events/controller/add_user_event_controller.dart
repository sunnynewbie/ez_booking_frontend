import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserEventController extends GetxController {
  RxList<EventUser> users = RxList.empty();
  EventModel? eventModel;
  var formKey = GlobalKey<FormState>();
  AddUserParam addUserParam;

  AddUserEventController({
    required this.addUserParam,
  });

  @override
  void onInit() {
    users.assignAll(addUserParam.users);
    eventModel = addUserParam.eventModel;
    super.onInit();
  }
}
