import 'dart:convert';

import 'package:intl/intl.dart';

class UpdateUserParam {
  String? f_name;
  String? l_name;
  int? gender;
  DateTime? dob;
  String? email;
  String? user_name;
  UpdateUserParam({
    this.f_name,
    this.l_name,
    this.gender,
    this.dob,
    this.email,
    this.user_name,
  });
  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(f_name != null){
      result.addAll({'f_name': f_name});
    }
    if(l_name != null){
      result.addAll({'l_name': l_name});
    }
    if(gender != null){
      result.addAll({'gender': gender});
    }
    if(dob != null){
      result.addAll({'dob': DateFormat('yyyy-MM-dd').format(dob!)});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(user_name != null){
      result.addAll({'user_name': user_name});
    }
  
    return result;
  }

}
