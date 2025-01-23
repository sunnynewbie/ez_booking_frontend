// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_and_reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventAndReviewModel _$EventAndReviewModelFromJson(Map<String, dynamic> json) =>
    EventAndReviewModel(
      event: EventModel.fromJson(json['event'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventAndReviewModelToJson(
        EventAndReviewModel instance) =>
    <String, dynamic>{
      'event': instance.event,
      'reviews': instance.reviews,
    };
