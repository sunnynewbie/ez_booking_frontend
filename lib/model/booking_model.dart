import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable(converters: [NumConverter(),StringConverter()])
class BookingModel {
  num booking_id;
  num event_id;
  num user_id;
  num booked_by_id;
  num amount;
  num discount;
  num time_slot_id;
  String week_days;
  num event_type;
  String booking_status;
  String parent_booking_id;
  String person_name;
  String person_dob;
  String person_contact;
  num person_gender;
  String sub_booking_id;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  BookingModel({
    required this.booking_id,
    required this.event_id,
    required this.user_id,
    required this.booked_by_id,
    required this.amount,
    required this.discount,
    required this.time_slot_id,
    required this.week_days,
    required this.event_type,
    required this.booking_status,
    required this.parent_booking_id,
    required this.person_name,
    required this.person_dob,
    required this.person_contact,
    required this.person_gender,
    required this.sub_booking_id,
  });
}

