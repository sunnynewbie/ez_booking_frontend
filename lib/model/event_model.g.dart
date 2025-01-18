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
      organizer: checkOrganizer(json['organizer']),
      address: const StringConverter().fromJson(json['address']),
      latitude: const NumConverter().fromJson(json['latitude']),
      longitude: const NumConverter().fromJson(json['longitude']),
      event_type: const NumConverter().fromJson(json['event_type']),
      event_city: const NumConverter().fromJson(json['event_city']),
      category_id: const NumConverter().fromJson(json['category_id']),
      quantity: const NumConverter().fromJson(json['quantity']),
      event_price: const NumConverter().fromJson(json['event_price']),
      features: const StringConverter().fromJson(json['features']),
      event_status: const NumConverter().fromJson(json['event_status']),
      created_at: const DateTimeConverter().fromJson(json['created_at']),
      updated_at: const DateTimeConverter().fromJson(json['updated_at']),
      event_date: const DateTimeConverter().fromJson(json['event_date']),
      event_time: json['event_time'],
      event_discount: const StringConverter().fromJson(json['event_discount']),
      is_recommended: const NumConverter().fromJson(json['is_recommended']),
      average_rating: const NumConverter().fromJson(json['average_rating']),
      total_reviews: const NumConverter().fromJson(json['total_reviews']),
      image_path: const NumConverter().fromJson(json['image_path']),
      category_name: const StringConverter().fromJson(json['category_name']),
      type: const StringConverter().fromJson(json['type']),
      city: checkCity(json['city']),
      platform_amount: const NumConverter().fromJson(json['platform_amount']),
      total_amount: const NumConverter().fromJson(json['total_amount']),
      event_days: checkEventDate(json['event_days']),
      images: checkImages(json['images']),
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
      'event_city': const NumConverter().toJson(instance.event_city),
      'category_id': const NumConverter().toJson(instance.category_id),
      'quantity': const NumConverter().toJson(instance.quantity),
      'event_price': const NumConverter().toJson(instance.event_price),
      'features': const StringConverter().toJson(instance.features),
      'event_status': const NumConverter().toJson(instance.event_status),
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      'updated_at': const DateTimeConverter().toJson(instance.updated_at),
      'event_date': const DateTimeConverter().toJson(instance.event_date),
      'event_time': instance.event_time,
      'event_discount': const StringConverter().toJson(instance.event_discount),
      'is_recommended': const NumConverter().toJson(instance.is_recommended),
      'average_rating': const NumConverter().toJson(instance.average_rating),
      'total_reviews': const NumConverter().toJson(instance.total_reviews),
      'image_path': const NumConverter().toJson(instance.image_path),
      'category_name': const StringConverter().toJson(instance.category_name),
      'type': const StringConverter().toJson(instance.type),
      'city': instance.city,
      'organizer': instance.organizer,
      'platform_amount': const NumConverter().toJson(instance.platform_amount),
      'total_amount': const NumConverter().toJson(instance.total_amount),
      'event_days': instance.event_days,
      'images': instance.images,
    };

Organizer _$OrganizerFromJson(Map<String, dynamic> json) => Organizer(
      instructor_id: const NumConverter().fromJson(json['instructor_id']),
      f_name: const StringConverter().fromJson(json['f_name']),
      l_name: const StringConverter().fromJson(json['l_name']),
      experience: const NumConverter().fromJson(json['experience']),
    );

Map<String, dynamic> _$OrganizerToJson(Organizer instance) => <String, dynamic>{
      'f_name': const StringConverter().toJson(instance.f_name),
      'l_name': const StringConverter().toJson(instance.l_name),
      'instructor_id': const NumConverter().toJson(instance.instructor_id),
      'experience': const NumConverter().toJson(instance.experience),
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      image_id: const NumConverter().fromJson(json['image_id']),
      image_path: const StringConverter().fromJson(json['image_path']),
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'image_id': const NumConverter().toJson(instance.image_id),
      'image_path': const StringConverter().toJson(instance.image_path),
    };
