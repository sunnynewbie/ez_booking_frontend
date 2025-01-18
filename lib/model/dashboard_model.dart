import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  List<PopularEventsBean> popular_events;
  List<AllCategoryBean> all_categories;


  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  DashboardModel({
    required this.popular_events,
    required this.all_categories,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter()])
class AllCategoryBean {
  String category_name;
  dynamic image_path;
  num total_events;
  num category_id;
  num event_type;

  factory AllCategoryBean.fromJson(Map<String, dynamic> json) => _$AllCategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoryBeanToJson(this);

  AllCategoryBean({
    required this.category_name,
    required this.image_path,
    required this.total_events,
    required this.category_id,
    required this.event_type,
  });
}

@JsonSerializable(converters: [StringConverter(),NumConverter(),DateTimeConverter()])
class PopularEventsBean {
  num event_id;
  DateTime event_date;
  String event_name;
  String address;
  String image_path;
  @JsonKey(fromJson: checkOrganizer)
  Organizer? organizer;



  factory PopularEventsBean.fromJson(Map<String, dynamic> json) => _$PopularEventsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PopularEventsBeanToJson(this);

  PopularEventsBean({
    required this.event_id,
    required this.event_date,
    required this.event_name,
    required this.address,
    required this.image_path,
    required this.organizer,
  });
}

