class EventPriceParam{
  int event_id;
  int user_count;

  EventPriceParam({
    required this.event_id,
    required this.user_count,
  });

  Map<String, dynamic> toMap() {
    return {
      'event_id': this.event_id,
      'total_user': this.user_count,
    };
  }
}