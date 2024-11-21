import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(converters: [StringConverter(),IntConverter()])
class EventModel {
  final int event_id;
  final String event_name;
  final String event_desc;
  final String tags;
  final String address;
  final double latitude;
  final double longitude;
  final int event_type;
  final int ticket;
  final int category_id;
  final int quantity;
  final String event_price;
  final List<String> features;
  final bool event_status;
  final String image_path;
  EventModel({
    required this.event_id,
    required this.event_name,
    required this.event_desc,
    required this.tags,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.event_type,
    required this.ticket,
    required this.category_id,
    required this.quantity,
    required this.event_price,
    required this.features,
    required this.event_status,
    required this.image_path,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
