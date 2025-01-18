import 'dart:convert';

import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_booking_model.g.dart';

@JsonSerializable()
class MyBookingModel {
  @JsonKey(fromJson: checkData)
  List<Booking_detailsBean> booking_details;

  factory MyBookingModel.fromJson(Map<String, dynamic> json) => _$MyBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyBookingModelToJson(this);

  MyBookingModel({
    required this.booking_details,
  });
}

checkData(dynamic data){
  if(data is String){
    return (jsonDecode(data) as List).map((e) => Booking_detailsBean.fromJson(e)).toList();
  }
  return (data as List).map((e) => Booking_detailsBean.fromJson(e)).toList();
}

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class Booking_detailsBean {
  num amount;
  dynamic discount;
  num booking_id;
  num booked_by_id;
  EventBean event_data;
  String person_dob;
  String person_name;
  String booking_date;
  num person_gender;
  String booking_status;
  String person_contact;
  String parent_booking_id;

  factory Booking_detailsBean.fromJson(Map<String, dynamic> json) => _$Booking_detailsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Booking_detailsBeanToJson(this);

  Booking_detailsBean({
    required this.amount,
    required this.discount,
    required this.booked_by_id,
    required this.booking_id,
    required this.event_data,
    required this.person_dob,
    required this.person_name,
    required this.booking_date,
    required this.person_gender,
    required this.booking_status,
    required this.person_contact,
    required this.parent_booking_id,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class Event_dataBean {
  String tags;
  String type;
  String address;
  String event_date;
  String event_name;

  factory Event_dataBean.fromJson(Map<String, dynamic> json) => _$Event_dataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Event_dataBeanToJson(this);

  Event_dataBean({
    required this.tags,
    required this.type,
    required this.address,
    required this.event_date,
    required this.event_name,
  });
}

