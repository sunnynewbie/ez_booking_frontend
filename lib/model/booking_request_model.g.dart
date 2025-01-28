// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequestModel _$BookingRequestModelFromJson(Map<String, dynamic> json) =>
    BookingRequestModel(
      id: const NumConverter().fromJson(json['id']),
      created_at: const DateTimeConverter().fromJson(json['created_at']),
      updated_at: const DateTimeConverter().fromJson(json['updated_at']),
      status: const StringConverter().fromJson(json['status']),
      image_path: const StringConverter().fromJson(json['image_path']),
      average_rating: const NumConverter().fromJson(json['average_rating']),
      total_reviews: const NumConverter().fromJson(json['total_reviews']),
      event: EventModel.fromJson(json['event'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingRequestModelToJson(
        BookingRequestModel instance) =>
    <String, dynamic>{
      'id': const NumConverter().toJson(instance.id),
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      'updated_at': const DateTimeConverter().toJson(instance.updated_at),
      'status': const StringConverter().toJson(instance.status),
      'image_path': const StringConverter().toJson(instance.image_path),
      'average_rating': const NumConverter().toJson(instance.average_rating),
      'total_reviews': const NumConverter().toJson(instance.total_reviews),
      'event': instance.event,
      'user': instance.user,
    };
