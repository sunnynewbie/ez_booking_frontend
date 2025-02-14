import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/city_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
enum UserType{
  @JsonValue("guest")
  guest,
  @JsonValue("user")
  user;
}
@JsonSerializable(
    converters: [StringConverter(), IntConverter(), NumConverter()])
class UserModel {
  final int id;
  final String f_name;
  final String l_name;
  final String user_name;
  final String email;
  final String dob;
  final String phone_no;
  final int gender;
  final String otp;
  final String firebase_id;
  final String device_id;
  final String img;
  final num city_id;
  final CityModel? city;
  @JsonKey(disallowNullValue: false,defaultValue: UserType.user,unknownEnumValue: UserType.user)
  final UserType user_type;

  UserModel({
    required this.id,
    required this.f_name,
    required this.l_name,
    required this.user_name,
    required this.firebase_id,
    required this.dob,
    required this.email,
    required this.phone_no,
    required this.gender,
    required this.otp,
    required this.city_id,
    required this.device_id,
    required this.city,
    required this.user_type,
    required this.img,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String get displayName {
    if (f_name.isEmpty && l_name.isEmpty) {
      return 'Ez user';
    }

    return '$f_name $l_name';
  }
}
