import 'dart:convert';

import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/city_model.dart';
import 'package:ez_booking/model/event_days.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(converters: [
  StringConverter(),
  NumConverter(),
  DateTimeConverter(),
  DateNullableConverter(),
  BoolConverter(),
])
class EventModel {
  num event_id;
  String event_name;
  String event_desc;
  String tags;
  String address;
  num latitude;
  num longitude;
  num event_type;
  num event_city;
  num category_id;
  num quantity;
  num event_price;
  String features;
  num event_status;
  DateTime created_at;
  DateTime updated_at;
  DateTime event_date;
  dynamic event_time;
  String event_discount;
  num is_recommended;
  num average_rating;
  num total_reviews;
  String image_path;
  String category_name;
  String type;
  @JsonKey(fromJson: checkCity)
  CityModel city;
  @JsonKey(fromJson: checkOrganizer, name: 'eventOrganizer')
  Organizer? organizer;
  num platform_amount;
  num total_amount;
  bool is_booking_requested;
  @JsonKey(fromJson: checkEventDate)
  List<EventDays>? event_days;
  @JsonKey(fromJson: checkImages)
  List<ImageModel> images;

  String get dateStr => DateFormat('dd MMM,yyyy').format(event_date!);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

  EventModel({
    required this.event_id,
    required this.event_name,
    required this.event_desc,
    required this.tags,
    required this.organizer,
    required this.address,
    required this.is_booking_requested,
    required this.latitude,
    required this.longitude,
    required this.event_type,
    required this.event_city,
    required this.category_id,
    required this.quantity,
    required this.event_price,
    required this.features,
    required this.event_status,
    required this.created_at,
    required this.updated_at,
    required this.event_date,
    required this.event_time,
    required this.event_discount,
    required this.is_recommended,
    required this.average_rating,
    required this.total_reviews,
    required this.image_path,
    required this.category_name,
    required this.type,
    required this.city,
    required this.platform_amount,
    required this.total_amount,
    this.event_days,
    required this.images,
  });
}

checkCity(dynamic data) {
  if (data == null) {
    return null;
  }
  if (data is String) {
    return CityModel.fromJson(jsonDecode(data));
  }
  return CityModel.fromJson(data);
}

checkOrganizer(dynamic data) {
  if (data is String) {
    return Organizer.fromJson(jsonDecode(data));
  }
  if (data != null) {
    return Organizer.fromJson(data);
  }
}

checkEventDate(dynamic data) {
  if (data == null) {
    return null;
  }
  if (data is String) {
    return (jsonDecode(data) as List)
        .map((e) => EventDays.fromJson(e))
        .toList();
  }
  return (data as List).map((e) => EventDays.fromJson(e)).toList();
}

checkImages(dynamic data) {
  if (data == null) {
    return <ImageModel>[];
  }
  if (data is String) {
    return (jsonDecode(data) as List)
        .map((e) => ImageModel.fromJson(e))
        .toList();
  }
  return (data as List).map((e) => ImageModel.fromJson(e)).toList();
}

@JsonSerializable(converters: [
  StringConverter(),
  NumConverter(),
  DateTimeConverter(),
  DateNullableConverter()
])
class Organizer {
  String f_name;
  String l_name;
  num instructor_id;
  num experience;

  Organizer(
      {required this.instructor_id,
      required this.f_name,
      required this.l_name,
      required this.experience});

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizerToJson(this);
}

@JsonSerializable(converters: [
  StringConverter(),
  NumConverter(),
  DateTimeConverter(),
  DateNullableConverter()
])
class ImageModel {
  num image_id;
  String image_path;

  ImageModel({
    required this.image_id,
    required this.image_path,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
