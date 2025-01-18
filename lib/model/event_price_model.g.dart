// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventPriceModel _$EventPriceModelFromJson(Map<String, dynamic> json) =>
    EventPriceModel(
      event_id: json['event_id'] as num,
      platform_amount: json['platform_amount'] as num,
      total_amount: json['total_amount'] as num,
      amount: json['amount'] as num,
    );

Map<String, dynamic> _$EventPriceModelToJson(EventPriceModel instance) =>
    <String, dynamic>{
      'event_id': instance.event_id,
      'platform_amount': instance.platform_amount,
      'total_amount': instance.total_amount,
      'amount': instance.amount,
    };
