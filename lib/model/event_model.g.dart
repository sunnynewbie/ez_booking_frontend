// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      event_id: const NumConverter().fromJson(json['event_id']),
      event_name: const StringConverter().fromJson(json['event_name']),
      event_desc: const StringConverter().fromJson(json['event_desc']),
      tags: const StringConverter().fromJson(json['tags']),
      address: const StringConverter().fromJson(json['address']),
      latitude: const NumConverter().fromJson(json['latitude']),
      longitude: const NumConverter().fromJson(json['longitude']),
      event_type: const NumConverter().fromJson(json['event_type']),
      ticket: const NumConverter().fromJson(json['ticket']),
      category_id: const NumConverter().fromJson(json['category_id']),
      quantity: const NumConverter().fromJson(json['quantity']),
      event_price: const NumConverter().fromJson(json['event_price']),
      features: (json['features'] as List<dynamic>?)
              ?.map(const StringConverter().fromJson)
              .toList() ??
          [],
      event_status: const IntConverter().fromJson(json['event_status']),
      event_date: const DateNullableConverter().fromJson(json['event_date']),
      createdAt: const DateNullableConverter().fromJson(json['createdAt']),
      updatedAt: const DateNullableConverter().fromJson(json['updatedAt']),
      image_path: const StringConverter().fromJson(json['image_path']),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'event_id': const NumConverter().toJson(instance.event_id),
      'event_name': const StringConverter().toJson(instance.event_name),
      'event_desc': const StringConverter().toJson(instance.event_desc),
      'tags': const StringConverter().toJson(instance.tags),
      'address': const StringConverter().toJson(instance.address),
      'latitude': const NumConverter().toJson(instance.latitude),
      'longitude': const NumConverter().toJson(instance.longitude),
      'event_type': const NumConverter().toJson(instance.event_type),
      'ticket': const NumConverter().toJson(instance.ticket),
      'category_id': const NumConverter().toJson(instance.category_id),
      'quantity': const NumConverter().toJson(instance.quantity),
      'event_price': const NumConverter().toJson(instance.event_price),
      'features':
          instance.features.map(const StringConverter().toJson).toList(),
      'event_status': const IntConverter().toJson(instance.event_status),
      'event_date': const DateNullableConverter().toJson(instance.event_date),
      'createdAt': const DateNullableConverter().toJson(instance.createdAt),
      'updatedAt': const DateNullableConverter().toJson(instance.updatedAt),
      'image_path': const StringConverter().toJson(instance.image_path),
    };
