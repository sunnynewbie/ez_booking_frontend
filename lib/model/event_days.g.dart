// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDays _$EventDaysFromJson(Map<String, dynamic> json) => EventDays(
      label: const StringConverter().fromJson(json['label']),
      value: const NumConverter().fromJson(json['value']),
    );

Map<String, dynamic> _$EventDaysToJson(EventDays instance) => <String, dynamic>{
      'label': const StringConverter().toJson(instance.label),
      'value': const NumConverter().toJson(instance.value),
    };
