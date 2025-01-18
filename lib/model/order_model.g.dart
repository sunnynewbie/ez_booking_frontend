// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      booking_id: const NumConverter().fromJson(json['booking_id']),
      event_id: const NumConverter().fromJson(json['event_id']),
      user_id: const NumConverter().fromJson(json['user_id']),
      payment_status: const StringConverter().fromJson(json['payment_status']),
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
      booking_status: const StringConverter().fromJson(json['booking_status']),
      booking_date: DateTime.parse(json['booking_date'] as String),
      transaction_json:
          const StringConverter().fromJson(json['transaction_json']),
      sub_booking_id: const StringConverter().fromJson(json['sub_booking_id']),
      parent_booking_id:
          const StringConverter().fromJson(json['parent_booking_id']),
      event: EventBean.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'event_id': const NumConverter().toJson(instance.event_id),
      'user_id': const NumConverter().toJson(instance.user_id),
      'payment_status': const StringConverter().toJson(instance.payment_status),
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
      'booking_status': const StringConverter().toJson(instance.booking_status),
      'booking_date': instance.booking_date.toIso8601String(),
      'transaction_json':
          const StringConverter().toJson(instance.transaction_json),
      'sub_booking_id': const StringConverter().toJson(instance.sub_booking_id),
      'parent_booking_id':
          const StringConverter().toJson(instance.parent_booking_id),
      'event': instance.event,
    };

EventBean _$EventBeanFromJson(Map<String, dynamic> json) => EventBean(
      event_name: const StringConverter().fromJson(json['event_name']),
      address: const StringConverter().fromJson(json['address']),
      event_id: const NumConverter().fromJson(json['event_id']),
    );

Map<String, dynamic> _$EventBeanToJson(EventBean instance) => <String, dynamic>{
      'event_name': const StringConverter().toJson(instance.event_name),
      'address': const StringConverter().toJson(instance.address),
      'event_id': const NumConverter().toJson(instance.event_id),
    };
