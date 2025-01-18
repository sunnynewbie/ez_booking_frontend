import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class OrderModel {
  num booking_id;
  num event_id;
  num user_id;
  String payment_status;
  String transaction_id;
  String person_name;
  String person_contact;
  num person_gender;
  String person_dob;
  num booked_by_id;
  num amount;
  num discount;
  num time_slot_id;
  String week_days;
  num event_type;
  String booking_status;
  DateTime booking_date;
  String transaction_json;
  String sub_booking_id;
  String parent_booking_id;
  EventBean event;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  OrderModel({
    required this.booking_id,
    required this.event_id,
    required this.user_id,
    required this.payment_status,
    required this.transaction_id,
    required this.person_name,
    required this.person_contact,
    required this.person_gender,
    required this.person_dob,
    required this.booked_by_id,
    required this.amount,
    required this.discount,
    required this.time_slot_id,
    required this.week_days,
    required this.event_type,
    required this.booking_status,
    required this.booking_date,
    required this.transaction_json,
    required this.sub_booking_id,
    required this.parent_booking_id,
    required this.event,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class EventBean {
  String event_name;
  String address;
  num event_id;

  factory EventBean.fromJson(Map<String, dynamic> json) => _$EventBeanFromJson(json);

  Map<String, dynamic> toJson() => _$EventBeanToJson(this);

  EventBean({
    required this.event_name,
    required this.address,
    required this.event_id,
  });
}

