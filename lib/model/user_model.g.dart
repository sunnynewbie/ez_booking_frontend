// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: const IntConverter().fromJson(json['id']),
      f_name: const StringConverter().fromJson(json['f_name']),
      l_name: const StringConverter().fromJson(json['l_name']),
      user_name: const StringConverter().fromJson(json['user_name']),
      dob: const StringConverter().fromJson(json['dob']),
      email: const StringConverter().fromJson(json['email']),
      phone_no: const StringConverter().fromJson(json['phone_no']),
      gender: const IntConverter().fromJson(json['gender']),
      otp: const StringConverter().fromJson(json['otp']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': const IntConverter().toJson(instance.id),
      'f_name': const StringConverter().toJson(instance.f_name),
      'l_name': const StringConverter().toJson(instance.l_name),
      'user_name': const StringConverter().toJson(instance.user_name),
      'email': const StringConverter().toJson(instance.email),
      'dob': const StringConverter().toJson(instance.dob),
      'phone_no': const StringConverter().toJson(instance.phone_no),
      'gender': const IntConverter().toJson(instance.gender),
      'otp': const StringConverter().toJson(instance.otp),
    };
