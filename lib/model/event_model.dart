import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(
    converters: [StringConverter(), IntConverter(),NumConverter(), DateNullableConverter()])
class EventModel {
  num event_id;
  String event_name;
  String event_desc;
  String tags;
  String address;
  num latitude;
  num longitude;
  num event_type;
  num ticket;
  num category_id;
  num quantity;
  String event_price;
  @JsonKey(defaultValue: [], disallowNullValue: false)
  List<String> features;
  int event_status;
  DateTime? event_date;
  DateTime? createdAt;
  DateTime? updatedAt;
  String image_path;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

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
    required this.event_date,
    required this.createdAt,
    required this.updatedAt,
    required this.image_path,
  });
}
