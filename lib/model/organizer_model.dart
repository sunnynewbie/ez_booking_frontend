import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer_model.g.dart';

@JsonSerializable(
  converters: [StringConverter(),NumConverter(),DateNullableConverter()]
)
class OrganizerModel {
  num instructor_id;
  String f_name;
  String l_name;
  String location;
  String bio;
  String categories;
  num event_id;
  num active;
  String contact_no;
  num experience;
  bool verified;
  DateTime created_at;
  DateTime updated_at;
  String image_path;

  factory OrganizerModel.fromJson(Map<String, dynamic> json) => _$OrganizerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizerModelToJson(this);

  OrganizerModel({
    required this.instructor_id,
    required this.f_name,
    required this.l_name,
    required this.location,
    required this.bio,
    required this.categories,
    required this.event_id,
    required this.active,
    required this.contact_no,
    required this.experience,
    required this.verified,
    required this.created_at,
    required this.updated_at,
    required this.image_path,
  });
}

