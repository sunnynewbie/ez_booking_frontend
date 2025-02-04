// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: const NumConverter().fromJson(json['id']),
      title: const StringConverter().fromJson(json['title']),
      body: const StringConverter().fromJson(json['body']),
      data: const StringConverter().fromJson(json['data']),
      created_at: const DateTimeConverter().fromJson(json['created_at']),
      updated_at: const DateTimeConverter().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': const NumConverter().toJson(instance.id),
      'title': const StringConverter().toJson(instance.title),
      'body': const StringConverter().toJson(instance.body),
      'data': const StringConverter().toJson(instance.data),
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      'updated_at': const DateTimeConverter().toJson(instance.updated_at),
    };
