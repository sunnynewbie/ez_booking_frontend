// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyModel _$PrivacyModelFromJson(Map<String, dynamic> json) => PrivacyModel(
      id: const NumConverter().fromJson(json['id']),
      title: const StringConverter().fromJson(json['title']),
      category: const StringConverter().fromJson(json['category']),
      status: const StringConverter().fromJson(json['status']),
      created_at: const DateTimeConverter().fromJson(json['created_at']),
      updated_at: const DateTimeConverter().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$PrivacyModelToJson(PrivacyModel instance) =>
    <String, dynamic>{
      'id': const NumConverter().toJson(instance.id),
      'title': const StringConverter().toJson(instance.title),
      'category': const StringConverter().toJson(instance.category),
      'status': const StringConverter().toJson(instance.status),
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      'updated_at': const DateTimeConverter().toJson(instance.updated_at),
    };
