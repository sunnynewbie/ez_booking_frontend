import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable(
  converters: [StringConverter(),NumConverter(),DateTimeConverter()]
)
class CityModel {
  num city_id;
  String city_name;
  String image_path;

  bool? status;
  bool? is_top;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  CityModel({
    required this.city_id,
    required this.city_name,
    required this.image_path,
    required this.status,
    required this.is_top,
  });
}

