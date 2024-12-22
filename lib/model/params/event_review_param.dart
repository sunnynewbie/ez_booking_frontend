class EventReviewParam{
  int page;
  int limit;
  int event_id;

  EventReviewParam({
    required this.page,
    required this.limit,
    required this.event_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': this.page,
      'limit': this.limit,
      'event_id': this.event_id,
    };
  }
}