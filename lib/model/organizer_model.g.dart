// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizerModel _$OrganizerModelFromJson(Map<String, dynamic> json) =>
    OrganizerModel(
      instructor_id: const NumConverter().fromJson(json['instructor_id']),
      f_name: const StringConverter().fromJson(json['f_name']),
      l_name: const StringConverter().fromJson(json['l_name']),
      location: const StringConverter().fromJson(json['location']),
      bio: const StringConverter().fromJson(json['bio']),
      categories: const StringConverter().fromJson(json['categories']),
      event_id: const NumConverter().fromJson(json['event_id']),
      active: const NumConverter().fromJson(json['active']),
      contact_no: const StringConverter().fromJson(json['contact_no']),
      experience: const NumConverter().fromJson(json['experience']),
      verified: json['verified'] as bool,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      image_path: const StringConverter().fromJson(json['image_path']),
    );

Map<String, dynamic> _$OrganizerModelToJson(OrganizerModel instance) =>
    <String, dynamic>{
      'instructor_id': const NumConverter().toJson(instance.instructor_id),
      'f_name': const StringConverter().toJson(instance.f_name),
      'l_name': const StringConverter().toJson(instance.l_name),
      'location': const StringConverter().toJson(instance.location),
      'bio': const StringConverter().toJson(instance.bio),
      'categories': const StringConverter().toJson(instance.categories),
      'event_id': const NumConverter().toJson(instance.event_id),
      'active': const NumConverter().toJson(instance.active),
      'contact_no': const StringConverter().toJson(instance.contact_no),
      'experience': const NumConverter().toJson(instance.experience),
      'verified': instance.verified,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'image_path': const StringConverter().toJson(instance.image_path),
    };
