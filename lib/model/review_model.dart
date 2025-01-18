import 'dart:convert';

import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable(converters: [
  StringConverter(),
  NumConverter(),
  DateTimeConverter(),
  IntConverter()
])
class ReviewModel {
  bool is_approved;
  num id;
  num rating;
  String message;
  num review_by;
  num event_id;
  num booking_id;
  DateTime updated_at;
  DateTime created_at;
  @JsonKey(disallowNullValue: true, fromJson: checkEvent)
  EventBean? events;
  @JsonKey(disallowNullValue: false, fromJson: checkUser)
  UserModel? user;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  ReviewModel({
    required this.is_approved,
    required this.id,
    required this.rating,
    required this.message,
    required this.review_by,
    required this.event_id,
    required this.booking_id,
    required this.updated_at,
    required this.created_at,
    required this.user,
    required this.events,
  });
}

checkEvent(dynamic data) {
  try {
    if (data is String) {
      return EventBean.fromJson(jsonDecode(data));
    }
    if (data is Map) {
      return EventBean.fromJson(data as Map<String, dynamic>);
    }
  } on Exception catch (e) {
    // TODO
  }
  return null;
}

checkUser(dynamic data) {
  try {
    if (data is String) {
      return UserModel.fromJson(jsonDecode(data));
    }
    if (data is Map<String, dynamic>) {
      return UserModel.fromJson(data);
    }
  } on Exception catch (e) {
    // TODO
  }
}
