// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      city_id: json['city_id'] as num,
      city_name: json['city_name'] as String,
      status: json['status'] as bool?,
      is_top: json['is_top'] as bool?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'city_id': instance.city_id,
      'city_name': instance.city_name,
      'status': instance.status,
      'is_top': instance.is_top,
    };
