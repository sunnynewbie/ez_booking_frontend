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
      event_type: const StringConverter().fromJson(json['event_type']),
      result_type: const StringConverter().fromJson(json['result_type']),
      image_path: const StringConverter().fromJson(json['image_path']),
    );

Map<String, dynamic> _$SearchItemToJson(SearchItem instance) =>
    <String, dynamic>{
      'name': const StringConverter().toJson(instance.name),
      'id': const NumConverter().toJson(instance.id),
      'address': const StringConverter().toJson(instance.address),
      'event_type': const StringConverter().toJson(instance.event_type),
      'result_type': const StringConverter().toJson(instance.result_type),
      'image_path': const StringConverter().toJson(instance.image_path),
    };
