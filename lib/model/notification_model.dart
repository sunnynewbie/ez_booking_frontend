import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(converters: [DateTimeConverter(),StringConverter(),NumConverter()])
class NotificationModel {
  num id;
  String title;
  String body;
  String data;
  DateTime created_at;
  DateTime updated_at;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.data,
    required this.created_at,
    required this.updated_at,
  });
}

