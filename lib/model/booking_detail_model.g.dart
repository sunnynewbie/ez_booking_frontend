// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDetailModel _$BookingDetailModelFromJson(Map<String, dynamic> json) =>
    BookingDetailModel(
      booking_id: const NumConverter().fromJson(json['booking_id']),
      event_id: const NumConverter().fromJson(json['event_id']),
      user_id: const NumConverter().fromJson(json['user_id']),
      payment_status: const NumConverter().fromJson(json['payment_status']),
      transaction_id: const StringConverter().fromJson(json['transaction_id']),
      person_name: const StringConverter().fromJson(json['person_name']),
      person_contact: const StringConverter().fromJson(json['person_contact']),
      person_gender: const NumConverter().fromJson(json['person_gender']),
      person_dob: const StringConverter().fromJson(json['person_dob']),
      booked_by_id: const NumConverter().fromJson(json['booked_by_id']),
      amount: const NumConverter().fromJson(json['amount']),
      discount: const NumConverter().fromJson(json['discount']),
      time_slot_id: const NumConverter().fromJson(json['time_slot_id']),
      week_days: const StringConverter().fromJson(json['week_days']),
      event_type: const NumConverter().fromJson(json['event_type']),
      booking_status: json['booking_status'],
      booking_date: const DateTimeConverter().fromJson(json['booking_date']),
      transaction_json:
          const StringConverter().fromJson(json['transaction_json']),
      event: EventBean.fromJson(json['event'] as Map<String, dynamic>),
      time_slot: json['time_slot'] == null
          ? null
          : Time_slotBean.fromJson(json['time_slot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDetailModelToJson(BookingDetailModel instance) =>
    <String, dynamic>{
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'event_id': const NumConverter().toJson(instance.event_id),
      'user_id': const NumConverter().toJson(instance.user_id),
      'payment_status': const NumConverter().toJson(instance.payment_status),
      'transaction_id': const StringConverter().toJson(instance.transaction_id),
      'person_name': const StringConverter().toJson(instance.person_name),
      'person_contact': const StringConverter().toJson(instance.person_contact),
      'person_gender': const NumConverter().toJson(instance.person_gender),
      'person_dob': const StringConverter().toJson(instance.person_dob),
      'booked_by_id': const NumConverter().toJson(instance.booked_by_id),
      'amount': const NumConverter().toJson(instance.amount),
      'discount': const NumConverter().toJson(instance.discount),
      'time_slot_id': const NumConverter().toJson(instance.time_slot_id),
      'week_days': const StringConverter().toJson(instance.week_days),
      'event_type': const NumConverter().toJson(instance.event_type),
      'booking_status': instance.booking_status,
      'booking_date': const DateTimeConverter().toJson(instance.booking_date),
      'transaction_json':
          const StringConverter().toJson(instance.transaction_json),
      'event': instance.event,
      'time_slot': instance.time_slot,
    };

Time_slotBean _$Time_slotBeanFromJson(Map<String, dynamic> json) =>
    Time_slotBean(
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
    );

Map<String, dynamic> _$Time_slotBeanToJson(Time_slotBean instance) =>
    <String, dynamic>{
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };

EventBean _$EventBeanFromJson(Map<String, dynamic> json) => EventBean(
      event_id: (json['event_id'] as num).toInt(),
      event_name: const StringConverter().fromJson(json['event_name']),
      address: const StringConverter().fromJson(json['address']),
      tags: const StringConverter().fromJson(json['tags']),
    );

Map<String, dynamic> _$EventBeanToJson(EventBean instance) => <String, dynamic>{
      'event_id': instance.event_id,
      'event_name': const StringConverter().toJson(instance.event_name),
      'address': const StringConverter().toJson(instance.address),
      'tags': const StringConverter().toJson(instance.tags),
    };
