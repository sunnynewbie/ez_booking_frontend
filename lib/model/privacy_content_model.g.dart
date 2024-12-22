// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyContentModel _$PrivacyContentModelFromJson(Map<String, dynamic> json) =>
    PrivacyContentModel(
      content: const StringConverter().fromJson(json['content']),
      policy_id: const NumConverter().fromJson(json['policy_id']),
      version_number: const NumConverter().fromJson(json['version_number']),
    );

Map<String, dynamic> _$PrivacyContentModelToJson(
        PrivacyContentModel instance) =>
    <String, dynamic>{
      'content': const StringConverter().toJson(instance.content),
      'policy_id': const NumConverter().toJson(instance.policy_id),
      'version_number': const NumConverter().toJson(instance.version_number),
    };
