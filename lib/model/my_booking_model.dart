import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_booking_model.g.dart';

@JsonSerializable(converters: [NumConverter(),DateTimeConverter()])
class MyBookingModel {
  num booking_id;
  DateTime booking_date;
  DateTime created_at;
  DateTime updated_at;
  num amount;
  num discount;
  EventBean event;
  Time_slotBean? time_slot;

  factory MyBookingModel.fromJson(Map<String, dynamic> json) => _$MyBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyBookingModelToJson(this);

  MyBookingModel({
    required this.booking_id,
    required this.booking_date,
    required this.created_at,
    required this.updated_at,
    required this.amount,
    required this.discount,
    required this.event,
    this.time_slot,
  });
}

@JsonSerializable(converters: [NumConverter(),DateTimeConverter()])
class Time_slotBean {
  String? start_time;
  String? end_time;


  Time_slotBean({this.start_time, this.end_time});

  factory Time_slotBean.fromJson(Map<String, dynamic> json) => _$Time_slotBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Time_slotBeanToJson(this);
}

@JsonSerializable(converters: [NumConverter(),DateTimeConverter()])
class EventBean {
  String event_name;
  String address;
  String tags;

  factory EventBean.fromJson(Map<String, dynamic> json) => _$EventBeanFromJson(json);

  Map<String, dynamic> toJson() => _$EventBeanToJson(this);

  EventBean({
    required this.event_name,
    required this.address,
    required this.tags,
  });
}

