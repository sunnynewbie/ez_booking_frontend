// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: const IntConverter().fromJson(json['id']),
      name: const StringConverter().fromJson(json['name']),
      user_name: const StringConverter().fromJson(json['user_name']),
      phone_no: const StringConverter().fromJson(json['phone_no']),
      gender: const IntConverter().fromJson(json['gender']),
      otp: const StringConverter().fromJson(json['otp']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': const IntConverter().toJson(instance.id),
      'name': const StringConverter().toJson(instance.name),
      'user_name': const StringConverter().toJson(instance.user_name),
      'phone_no': const StringConverter().toJson(instance.phone_no),
      'gender': const IntConverter().toJson(instance.gender),
      'otp': const StringConverter().toJson(instance.otp),
    };
