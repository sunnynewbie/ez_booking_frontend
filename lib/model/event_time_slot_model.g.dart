// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_time_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventTimeSlotModel _$EventTimeSlotModelFromJson(Map<String, dynamic> json) =>
    EventTimeSlotModel(
      start_time: const StringConverter().fromJson(json['start_time']),
      end_time: const StringConverter().fromJson(json['end_time']),
      time_slot_id: const NumConverter().fromJson(json['time_slot_id']),
    );

Map<String, dynamic> _$EventTimeSlotModelToJson(EventTimeSlotModel instance) =>
    <String, dynamic>{
      'start_time': const StringConverter().toJson(instance.start_time),
      'end_time': const StringConverter().toJson(instance.end_time),
      'time_slot_id': const NumConverter().toJson(instance.time_slot_id),
    };
