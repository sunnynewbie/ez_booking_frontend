// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBookingModel _$MyBookingModelFromJson(Map<String, dynamic> json) =>
    MyBookingModel(
      booking_id: const NumConverter().fromJson(json['booking_id']),
      booking_date: const DateTimeConverter().fromJson(json['booking_date']),
      created_at: const DateTimeConverter().fromJson(json['created_at']),
      updated_at: const DateTimeConverter().fromJson(json['updated_at']),
      amount: const NumConverter().fromJson(json['amount']),
      discount: const NumConverter().fromJson(json['discount']),
      event: EventBean.fromJson(json['event'] as Map<String, dynamic>),
      time_slot: json['time_slot'] == null
          ? null
          : Time_slotBean.fromJson(json['time_slot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyBookingModelToJson(MyBookingModel instance) =>
    <String, dynamic>{
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'booking_date': const DateTimeConverter().toJson(instance.booking_date),
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      'updated_at': const DateTimeConverter().toJson(instance.updated_at),
      'amount': const NumConverter().toJson(instance.amount),
      'discount': const NumConverter().toJson(instance.discount),
      'event': instance.event,
      'time_slot': instance.time_slot,
    };

Time_slotBean _$Time_slotBeanFromJson(Map<String, dynamic> json) =>
    Time_slotBean(
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
    );

Map<String, dynamic> _$Time_slotBeanToJson(Time_slotBean instance) =>
    <String, dynamic>{
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };

EventBean _$EventBeanFromJson(Map<String, dynamic> json) => EventBean(
      event_name: json['event_name'] as String,
      address: json['address'] as String,
      tags: json['tags'] as String,
    );

Map<String, dynamic> _$EventBeanToJson(EventBean instance) => <String, dynamic>{
      'event_name': instance.event_name,
      'address': instance.address,
      'tags': instance.tags,
    };
