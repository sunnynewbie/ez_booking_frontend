import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_days.g.dart';

@JsonSerializable(converters: [NumConverter(),StringConverter()])
class EventDays {
  String label;
  num value;
  factory EventDays.fromJson(Map<String, dynamic> json) => _$EventDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EventDaysToJson(this);

  EventDays({required this.label,required this.value});
}

