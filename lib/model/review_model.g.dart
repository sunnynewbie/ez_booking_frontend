// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['events'],
  );
  return ReviewModel(
    is_approved: json['is_approved'] as bool,
    id: const NumConverter().fromJson(json['id']),
    rating: const NumConverter().fromJson(json['rating']),
    message: const StringConverter().fromJson(json['message']),
    review_by: const NumConverter().fromJson(json['review_by']),
    event_id: const NumConverter().fromJson(json['event_id']),
    booking_id: const NumConverter().fromJson(json['booking_id']),
    updated_at: const DateTimeConverter().fromJson(json['updated_at']),
    created_at: const DateTimeConverter().fromJson(json['created_at']),
  )..events = checkEvent(json['events']);
}

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'is_approved': instance.is_approved,
      'id': const NumConverter().toJson(instance.id),
      'rating': const NumConverter().toJson(instance.rating),
      'message': const StringConverter().toJson(instance.message),
      'review_by': const NumConverter().toJson(instance.review_by),
      'event_id': const NumConverter().toJson(instance.event_id),
      'booking_id': const NumConverter().toJson(instance.booking_id),
      'updated_at': const DateTimeConverter().toJson(instance.updated_at),
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      if (instance.events case final value?) 'events': value,
    };
