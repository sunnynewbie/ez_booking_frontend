// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      booking_id: const NumConverter().fromJson(json['booking_id']),
      event_id: const NumConverter().fromJson(json['event_id']),
      user_id: const NumConverter().fromJson(json['user_id']),
      booked_by_id: const NumConverter().fromJson(json['booked_by_id']),
      amount: const NumConverter().fromJson(json['amount']),
      discount: const NumConverter().fromJson(json['discount']),
      time_slot_id: const NumConverter().fromJson(json['time_slot_id']),
      week_days: const StringConverter().fromJson(json['week_days']),
      event_type: const NumConverter().fromJson(json['event_type']),
      booking_status: const StringConverter().fromJson(json['booking_status']),
      parent_booking_id:
          const StringConverter().fromJson(json['parent_booking_id']),
      person_name: const StringConverter().fromJson(json['person_name']),
      person_dob: const StringConverter().fromJson(json['person_dob']),
      person_contact: const StringConverter().fromJson(json['person_contact']),
      person_gender: const NumConverter().fromJson(json['person_gender']),
      sub_booking_id: const StringConverter().fromJson(json['sub_booking_id']),
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'event_id': const NumConverter().toJson(instance.event_id),
      'user_id': const NumConverter().toJson(instance.user_id),
      'booked_by_id': const NumConverter().toJson(instance.booked_by_id),
      'amount': const NumConverter().toJson(instance.amount),
      'discount': const NumConverter().toJson(instance.discount),
      'time_slot_id': const NumConverter().toJson(instance.time_slot_id),
      'week_days': const StringConverter().toJson(instance.week_days),
      'event_type': const NumConverter().toJson(instance.event_type),
      'booking_status': const StringConverter().toJson(instance.booking_status),
      'parent_booking_id':
          const StringConverter().toJson(instance.parent_booking_id),
      'person_name': const StringConverter().toJson(instance.person_name),
      'person_dob': const StringConverter().toJson(instance.person_dob),
      'person_contact': const StringConverter().toJson(instance.person_contact),
      'person_gender': const NumConverter().toJson(instance.person_gender),
      'sub_booking_id': const StringConverter().toJson(instance.sub_booking_id),
    };
