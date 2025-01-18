import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_model.g.dart';


@JsonSerializable()
class SearchResultModel {
  List<SearchItem> categories;
  List<SearchItem> events;

  SearchResultModel({required this.categories, required this.events});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}

@JsonSerializable(
  converters: [StringConverter(),NumConverter()]
)
class SearchItem {
  String name;
  num id;
  num average_rating;
  num total_reviews;
  String address;
  String event_type;
  String result_type;
  DateTime? event_date;
  String image_path;
  @JsonKey(fromJson: checkOrganizer)
  Organizer? organizer;

  factory SearchItem.fromJson(Map<String, dynamic> json) => _$SearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemToJson(this);

  SearchItem({
    required this.name,
    required this.id,
    required this.address,
    required this.event_date,
    required this.event_type,
    required this.result_type,
    required this.image_path,
    required this.average_rating,
    required this.total_reviews,
    required this.organizer,
  });
}
