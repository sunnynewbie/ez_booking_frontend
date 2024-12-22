// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_single_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSingleBookingModel _$CreateSingleBookingModelFromJson(
        Map<String, dynamic> json) =>
    CreateSingleBookingModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: OrderBean.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateSingleBookingModelToJson(
        CreateSingleBookingModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'order': instance.order,
    };

OrderBean _$OrderBeanFromJson(Map<String, dynamic> json) => OrderBean(
      amount: const NumConverter().fromJson(json['amount']),
      amount_due: const NumConverter().fromJson(json['amount_due']),
      amount_paid: const NumConverter().fromJson(json['amount_paid']),
      attempts: const NumConverter().fromJson(json['attempts']),
      created_at: const NumConverter().fromJson(json['created_at']),
      currency: const StringConverter().fromJson(json['currency']),
      entity: const StringConverter().fromJson(json['entity']),
      id: const StringConverter().fromJson(json['id']),
      notes: json['notes'],
      offer_id: const StringConverter().fromJson(json['offer_id']),
      receipt: const StringConverter().fromJson(json['receipt']),
      status: const StringConverter().fromJson(json['status']),
    );

Map<String, dynamic> _$OrderBeanToJson(OrderBean instance) => <String, dynamic>{
      'amount': const NumConverter().toJson(instance.amount),
      'amount_due': const NumConverter().toJson(instance.amount_due),
      'amount_paid': const NumConverter().toJson(instance.amount_paid),
      'attempts': const NumConverter().toJson(instance.attempts),
      'created_at': const NumConverter().toJson(instance.created_at),
      'currency': const StringConverter().toJson(instance.currency),
      'entity': const StringConverter().toJson(instance.entity),
      'id': const StringConverter().toJson(instance.id),
      'notes': instance.notes,
      'offer_id': const StringConverter().toJson(instance.offer_id),
      'receipt': const StringConverter().toJson(instance.receipt),
      'status': const StringConverter().toJson(instance.status),
    };

ListBean _$ListBeanFromJson(Map<String, dynamic> json) => ListBean(
      booking_date: const StringConverter().fromJson(json['booking_date']),
      booking_id: const NumConverter().fromJson(json['booking_id']),
      event_id: const NumConverter().fromJson(json['event_id']),
      user_id: const NumConverter().fromJson(json['user_id']),
      booked_by_id: const NumConverter().fromJson(json['booked_by_id']),
      event_type: const NumConverter().fromJson(json['event_type']),
      amount: const NumConverter().fromJson(json['amount']),
      discount: const NumConverter().fromJson(json['discount']),
      time_slot_id: json['time_slot_id'],
      week_days: const StringConverter().fromJson(json['week_days']),
      booking_status: const StringConverter().fromJson(json['booking_status']),
      person_name: const StringConverter().fromJson(json['person_name']),
      person_dob: json['person_dob'],
      person_contact: const StringConverter().fromJson(json['person_contact']),
      person_gender: const NumConverter().fromJson(json['person_gender']),
    );

Map<String, dynamic> _$ListBeanToJson(ListBean instance) => <String, dynamic>{
      'booking_date': const StringConverter().toJson(instance.booking_date),
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'event_id': const NumConverter().toJson(instance.event_id),
      'user_id': const NumConverter().toJson(instance.user_id),
      'booked_by_id': const NumConverter().toJson(instance.booked_by_id),
      'event_type': const NumConverter().toJson(instance.event_type),
      'amount': const NumConverter().toJson(instance.amount),
      'discount': const NumConverter().toJson(instance.discount),
      'time_slot_id': instance.time_slot_id,
      'week_days': const StringConverter().toJson(instance.week_days),
      'booking_status': const StringConverter().toJson(instance.booking_status),
      'person_name': const StringConverter().toJson(instance.person_name),
      'person_dob': instance.person_dob,
      'person_contact': const StringConverter().toJson(instance.person_contact),
      'person_gender': const NumConverter().toJson(instance.person_gender),
    };
