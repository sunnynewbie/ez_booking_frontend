// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => SearchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => SearchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'events': instance.events,
    };

SearchItem _$SearchItemFromJson(Map<String, dynamic> json) => SearchItem(
      name: const StringConverter().fromJson(json['name']),
      id: const NumConverter().fromJson(json['id']),
      address: const StringConverter().fromJson(json['address']),
      event_date: json['event_date'] == null
          ? null
          : DateTime.parse(json['event_date'] as String),
      event_type: const StringConverter().fromJson(json['event_type']),
      result_type: const StringConverter().fromJson(json['result_type']),
      image_path: const StringConverter().fromJson(json['image_path']),
      average_rating: const NumConverter().fromJson(json['average_rating']),
      total_reviews: const NumConverter().fromJson(json['total_reviews']),
      organizer: checkOrganizer(json['organizer']),
    );

Map<String, dynamic> _$SearchItemToJson(SearchItem instance) =>
    <String, dynamic>{
      'name': const StringConverter().toJson(instance.name),
      'id': const NumConverter().toJson(instance.id),
      'average_rating': const NumConverter().toJson(instance.average_rating),
      'total_reviews': const NumConverter().toJson(instance.total_reviews),
      'address': const StringConverter().toJson(instance.address),
      'event_type': const StringConverter().toJson(instance.event_type),
      'result_type': const StringConverter().toJson(instance.result_type),
      'event_date': instance.event_date?.toIso8601String(),
      'image_path': const StringConverter().toJson(instance.image_path),
      'organizer': instance.organizer,
    };
