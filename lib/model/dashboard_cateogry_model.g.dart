// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_cateogry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardCateogryModel _$DashboardCateogryModelFromJson(
        Map<String, dynamic> json) =>
    DashboardCateogryModel(
      category_type: Category_typeBean.fromJson(
          json['category_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardCateogryModelToJson(
        DashboardCateogryModel instance) =>
    <String, dynamic>{
      'category_type': instance.category_type,
    };

Category_typeBean _$Category_typeBeanFromJson(Map<String, dynamic> json) =>
    Category_typeBean(
      event_type: const NumConverter().fromJson(json['event_type']),
      category_type: const StringConverter().fromJson(json['category_type']),
      image_path: const StringConverter().fromJson(json['image_path']),
    );

Map<String, dynamic> _$Category_typeBeanToJson(Category_typeBean instance) =>
    <String, dynamic>{
      'event_type': const NumConverter().toJson(instance.event_type),
      'category_type': const StringConverter().toJson(instance.category_type),
      'image_path': const StringConverter().toJson(instance.image_path),
    };
