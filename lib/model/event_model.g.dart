// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      event_id: const IntConverter().fromJson(json['event_id']),
      event_name: const StringConverter().fromJson(json['event_name']),
      event_desc: const StringConverter().fromJson(json['event_desc']),
      tags: const StringConverter().fromJson(json['tags']),
      address: const StringConverter().fromJson(json['address']),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      event_type: const IntConverter().fromJson(json['event_type']),
      ticket: const IntConverter().fromJson(json['ticket']),
      category_id: const IntConverter().fromJson(json['category_id']),
      quantity: const IntConverter().fromJson(json['quantity']),
      event_price: const StringConverter().fromJson(json['event_price']),
      features: (json['features'] as List<dynamic>)
          .map(const StringConverter().fromJson)
          .toList(),
      event_status: json['event_status'] as bool,
      image_path: const StringConverter().fromJson(json['image_path']),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'event_id': const IntConverter().toJson(instance.event_id),
      'event_name': const StringConverter().toJson(instance.event_name),
      'event_desc': const StringConverter().toJson(instance.event_desc),
      'tags': const StringConverter().toJson(instance.tags),
      'address': const StringConverter().toJson(instance.address),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'event_type': const IntConverter().toJson(instance.event_type),
      'ticket': const IntConverter().toJson(instance.ticket),
      'category_id': const IntConverter().toJson(instance.category_id),
      'quantity': const IntConverter().toJson(instance.quantity),
      'event_price': const StringConverter().toJson(instance.event_price),
      'features':
          instance.features.map(const StringConverter().toJson).toList(),
      'event_status': instance.event_status,
      'image_path': const StringConverter().toJson(instance.image_path),
    };
