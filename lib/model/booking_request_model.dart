import 'package:ez_booking/core/api/json_converter.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_request_model.g.dart';

@JsonSerializable(
  converters: [StringConverter(),NumConverter(),DateTimeConverter()]
)
class BookingRequestModel {
  num id;
  DateTime created_at;
  DateTime updated_at;
  String status;
  String image_path;
  num average_rating;
  num total_reviews;
  EventModel event;
  UserModel user;

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) => _$BookingRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingRequestModelToJson(this);

  BookingRequestModel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.status,
    required this.image_path,
    required this.average_rating,
    required this.total_reviews,
    required this.event,
    required this.user,
  });
}
