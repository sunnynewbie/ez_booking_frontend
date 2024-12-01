import 'package:ez_booking/model/event_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventAddUserController extends GetxController {
  RxList<EventUser> adultUser = RxList.empty();
  RxList<EventUser> childUser = RxList.empty();
  var formKey = GlobalKey<FormState>();

  void addUser() {
    adultUser.add(EventUser());
  }

  void addChild() {
    childUser.add(EventUser()..isChild = true);
  }

  void removeUser() {
    if (adultUser.isNotEmpty) adultUser.removeLast();
  }

  void removeChild() {
    if (childUser.isNotEmpty) childUser.removeLast();
  }

  void submitUsers() {
    List<EventUser> events = [];
    events.addAll(adultUser);
    events.addAll(childUser);
    print(events.length);
    Get.back(result: events);
  }
}
