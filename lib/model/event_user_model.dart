import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class EventUser {
  TextEditingController fNameCtrl = TextEditingController(),
      lNameCtrl = TextEditingController(),
      phoneCtrl = TextEditingController(),
      dobCtrl = TextEditingController(),
      emailCtrll = TextEditingController();
  int? gender;
  DateTime? dob;
  bool isChild = false;

  EventUser({this.gender});

  Map<String, dynamic> toMap() => {
        "user_name": '${fNameCtrl.text.trim()} ${lNameCtrl.text.trim()}',
        "contact_no": phoneCtrl.text.trim(),
        "dob": dob?.toIso8601String(),
        "gender": gender??1
      };
}
