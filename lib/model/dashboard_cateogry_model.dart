import 'package:ez_booking/core/api/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_cateogry_model.g.dart';

@JsonSerializable(converters: [])
class DashboardCateogryModel {
  Category_typeBean category_type;


  factory DashboardCateogryModel.fromJson(Map<String, dynamic> json) => _$DashboardCateogryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardCateogryModelToJson(this);

  DashboardCateogryModel({
    required this.category_type,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class Category_typeBean {
  num event_type;
  num count;
  String category_type;
  String image_path;

  factory Category_typeBean.fromJson(Map<String, dynamic> json) => _$Category_typeBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Category_typeBeanToJson(this);

  Category_typeBean({
    required this.event_type,
    required this.count,
    required this.category_type,
    required this.image_path,
  });
}

