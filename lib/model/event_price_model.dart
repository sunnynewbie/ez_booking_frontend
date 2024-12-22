import 'package:json_annotation/json_annotation.dart';

part 'event_price_model.g.dart';

@JsonSerializable()
class EventPriceModel {
  num event_id;
  num platform_amount;
  num total_amount;
  num amount;

  factory EventPriceModel.fromJson(Map<String, dynamic> json) => _$EventPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventPriceModelToJson(this);

  EventPriceModel({
    required this.event_id,
    required this.platform_amount,
    required this.total_amount,
    required this.amount,
  });
}

