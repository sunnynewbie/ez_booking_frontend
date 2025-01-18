import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/booking_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_single_booking_model.g.dart';

@JsonSerializable()
class CreateSingleBookingModel {
  List<BookingModel> list;
  OrderBean order;

  factory CreateSingleBookingModel.fromJson(Map<String, dynamic> json) => _$CreateSingleBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSingleBookingModelToJson(this);

  CreateSingleBookingModel({
    required this.list,
    required this.order,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter(),])
class OrderBean {
  num amount;
  num amount_due;
  num amount_paid;
  num attempts;
  num created_at;
  String currency;
  String entity;
  String id;
  dynamic notes;
  String offer_id;
  String receipt;
  String status;

  factory OrderBean.fromJson(Map<String, dynamic> json) => _$OrderBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBeanToJson(this);

  OrderBean({
    required this.amount,
    required this.amount_due,
    required this.amount_paid,
    required this.attempts,
    required this.created_at,
    required this.currency,
    required this.entity,
    required this.id,
    required this.notes,
    required this.offer_id,
    required this.receipt,
    required this.status,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class ListBean {
  String booking_date;
  num booking_id;
  num event_id;
  num user_id;
  num booked_by_id;
  num event_type;
  num amount;
  num discount;
  dynamic time_slot_id;
  String week_days;
  String booking_status;
  String person_name;
  dynamic person_dob;
  String person_contact;
  num person_gender;

  factory ListBean.fromJson(Map<String, dynamic> json) => _$ListBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ListBeanToJson(this);

  ListBean({
    required this.booking_date,
    required this.booking_id,
    required this.event_id,
    required this.user_id,
    required this.booked_by_id,
    required this.event_type,
    required this.amount,
    required this.discount,
    required this.time_slot_id,
    required this.week_days,
    required this.booking_status,
    required this.person_name,
    required this.person_dob,
    required this.person_contact,
    required this.person_gender,
  });
}

