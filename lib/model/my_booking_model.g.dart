// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBookingModel _$MyBookingModelFromJson(Map<String, dynamic> json) =>
    MyBookingModel(
      booking_details: checkData(json['booking_details']),
    );

Map<String, dynamic> _$MyBookingModelToJson(MyBookingModel instance) =>
    <String, dynamic>{
      'booking_details': instance.booking_details,
    };

Booking_detailsBean _$Booking_detailsBeanFromJson(Map<String, dynamic> json) =>
    Booking_detailsBean(
      amount: const NumConverter().fromJson(json['amount']),
      discount: json['discount'],
      booked_by_id: const NumConverter().fromJson(json['booked_by_id']),
      booking_id: const NumConverter().fromJson(json['booking_id']),
      event_data:
          EventBean.fromJson(json['event_data'] as Map<String, dynamic>),
      person_dob: const StringConverter().fromJson(json['person_dob']),
      person_name: const StringConverter().fromJson(json['person_name']),
      booking_date: const StringConverter().fromJson(json['booking_date']),
      person_gender: const NumConverter().fromJson(json['person_gender']),
      booking_status: const StringConverter().fromJson(json['booking_status']),
      person_contact: const StringConverter().fromJson(json['person_contact']),
      parent_booking_id:
          const StringConverter().fromJson(json['parent_booking_id']),
    );

Map<String, dynamic> _$Booking_detailsBeanToJson(
        Booking_detailsBean instance) =>
    <String, dynamic>{
      'amount': const NumConverter().toJson(instance.amount),
      'discount': instance.discount,
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'booked_by_id': const NumConverter().toJson(instance.booked_by_id),
      'event_data': instance.event_data,
      'person_dob': const StringConverter().toJson(instance.person_dob),
      'person_name': const StringConverter().toJson(instance.person_name),
      'booking_date': const StringConverter().toJson(instance.booking_date),
      'person_gender': const NumConverter().toJson(instance.person_gender),
      'booking_status': const StringConverter().toJson(instance.booking_status),
      'person_contact': const StringConverter().toJson(instance.person_contact),
      'parent_booking_id':
          const StringConverter().toJson(instance.parent_booking_id),
    };

Event_dataBean _$Event_dataBeanFromJson(Map<String, dynamic> json) =>
    Event_dataBean(
      tags: const StringConverter().fromJson(json['tags']),
      type: const StringConverter().fromJson(json['type']),
      address: const StringConverter().fromJson(json['address']),
      event_date: const StringConverter().fromJson(json['event_date']),
      event_name: const StringConverter().fromJson(json['event_name']),
    );

Map<String, dynamic> _$Event_dataBeanToJson(Event_dataBean instance) =>
    <String, dynamic>{
      'tags': const StringConverter().toJson(instance.tags),
      'type': const StringConverter().toJson(instance.type),
      'address': const StringConverter().toJson(instance.address),
      'event_date': const StringConverter().toJson(instance.event_date),
      'event_name': const StringConverter().toJson(instance.event_name),
    };
