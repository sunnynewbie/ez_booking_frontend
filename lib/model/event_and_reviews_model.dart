import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'event_and_reviews_model.g.dart';

@JsonSerializable()
class EventAndReviewModel{
  EventModel event;
  List<ReviewModel> reviews;

  EventAndReviewModel({
    required this.event,
    required this.reviews,
  });
  factory EventAndReviewModel.fromJson(Map<String, dynamic> json) => _$EventAndReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventAndReviewModelToJson(this);

}