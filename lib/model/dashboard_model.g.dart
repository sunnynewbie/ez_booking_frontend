// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      popular_events: (json['popular_events'] as List<dynamic>)
          .map((e) => PopularEventsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      all_categories: (json['all_categories'] as List<dynamic>)
          .map((e) => AllCategoryBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'popular_events': instance.popular_events,
      'all_categories': instance.all_categories,
    };

AllCategoryBean _$AllCategoryBeanFromJson(Map<String, dynamic> json) =>
    AllCategoryBean(
      category_name: const StringConverter().fromJson(json['category_name']),
      image_path: json['image_path'],
      total_events: const NumConverter().fromJson(json['total_events']),
      category_id: const NumConverter().fromJson(json['category_id']),
      event_type: const NumConverter().fromJson(json['event_type']),
    );

Map<String, dynamic> _$AllCategoryBeanToJson(AllCategoryBean instance) =>
    <String, dynamic>{
      'category_name': const StringConverter().toJson(instance.category_name),
      'image_path': instance.image_path,
      'total_events': const NumConverter().toJson(instance.total_events),
      'category_id': const NumConverter().toJson(instance.category_id),
      'event_type': const NumConverter().toJson(instance.event_type),
    };

PopularEventsBean _$PopularEventsBeanFromJson(Map<String, dynamic> json) =>
    PopularEventsBean(
      event_id: const NumConverter().fromJson(json['event_id']),
      event_date: const DateTimeConverter().fromJson(json['event_date']),
      event_name: const StringConverter().fromJson(json['event_name']),
      address: const StringConverter().fromJson(json['address']),
      image_path: const StringConverter().fromJson(json['image_path']),
      organizer: checkOrganizer(json['organizer']),
    );

Map<String, dynamic> _$PopularEventsBeanToJson(PopularEventsBean instance) =>
    <String, dynamic>{
      'event_id': const NumConverter().toJson(instance.event_id),
      'event_date': const DateTimeConverter().toJson(instance.event_date),
      'event_name': const StringConverter().toJson(instance.event_name),
      'address': const StringConverter().toJson(instance.address),
      'image_path': const StringConverter().toJson(instance.image_path),
      'organizer': instance.organizer,
    };
