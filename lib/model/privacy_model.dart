import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'privacy_model.g.dart';

@JsonSerializable(converters: [StringConverter(),NumConverter(),DateTimeConverter()])
class PrivacyModel {
  num id;
  String title;
  String category;
  String status;
  DateTime created_at;
  DateTime updated_at;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => _$PrivacyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyModelToJson(this);

  PrivacyModel({
    required this.id,
    required this.title,
    required this.category,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });
}

