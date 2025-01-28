// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      city_id: const NumConverter().fromJson(json['city_id']),
      city_name: const StringConverter().fromJson(json['city_name']),
      image_path: const StringConverter().fromJson(json['image_path']),
      status: json['status'] as bool?,
      is_top: json['is_top'] as bool?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'city_id': const NumConverter().toJson(instance.city_id),
      'city_name': const StringConverter().toJson(instance.city_name),
      'image_path': const StringConverter().toJson(instance.image_path),
      'status': instance.status,
      'is_top': instance.is_top,
    };
