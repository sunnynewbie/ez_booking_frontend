import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable(converters: [StringConverter(),IntConverter()])
class UserModel {
  final int id;
  final String name;
  final String user_name;
  final String phone_no;
  final int gender;
  final String otp;
  UserModel({
    required this.id,
    required this.name,
    required this.user_name,
    required this.phone_no,
    required this.gender,
    required this.otp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
