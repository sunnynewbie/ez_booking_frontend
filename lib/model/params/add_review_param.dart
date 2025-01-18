class AddReviewParam{
  double rating;
  String message;
  int review_by;
  int event_id;
  int booking_id;

  AddReviewParam({
    required this.rating,
    required this.message,
    required this.review_by,
    required this.event_id,
    required this.booking_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'rating': this.rating,
      'message': this.message,
      'review_by': this.review_by,
      'event_id': this.event_id,
      'booking_id': this.booking_id,
    };
  }


}