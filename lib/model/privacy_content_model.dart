import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'privacy_content_model.g.dart';

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class PrivacyContentModel {
  String content;
  num policy_id;
  num version_number;

  factory PrivacyContentModel.fromJson(Map<String, dynamic> json) => _$PrivacyContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyContentModelToJson(this);

  PrivacyContentModel({
    required this.content,
    required this.policy_id,
    required this.version_number,
  });
}

