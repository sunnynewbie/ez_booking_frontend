import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_time_slot_model.g.dart';

@JsonSerializable(converters: [StringConverter(), NumConverter()])
class EventTimeSlotModel {
  String start_time;
  String end_time;
  num time_slot_id;

  factory EventTimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$EventTimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventTimeSlotModelToJson(this);

  EventTimeSlotModel({
    required this.start_time,
    required this.end_time,
    required this.time_slot_id,
  });
}
