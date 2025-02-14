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
      firebase_id: const StringConverter().fromJson(json['firebase_id']),
      dob: const StringConverter().fromJson(json['dob']),
      email: const StringConverter().fromJson(json['email']),
      phone_no: const StringConverter().fromJson(json['phone_no']),
      gender: const IntConverter().fromJson(json['gender']),
      otp: const StringConverter().fromJson(json['otp']),
      img: const StringConverter().fromJson(json['img']),
      city_id: const NumConverter().fromJson(json['city_id']),
      device_id: const StringConverter().fromJson(json['device_id']),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      user_type: $enumDecodeNullable(_$UserTypeEnumMap, json['user_type'],
              unknownValue: UserType.user) ??
          UserType.user,
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
      'img': const StringConverter().toJson(instance.img),
      'firebase_id': const StringConverter().toJson(instance.firebase_id),
      'device_id': const StringConverter().toJson(instance.device_id),
      'city_id': const NumConverter().toJson(instance.city_id),
      'city': instance.city,
      'user_type': _$UserTypeEnumMap[instance.user_type]!,
    };

const _$UserTypeEnumMap = {
  UserType.guest: 'guest',
  UserType.user: 'user',
};
