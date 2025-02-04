class BookingRequestparam {
  num? userId;
  num? event_id;
  String? status;
  num page;
  num limit;

  BookingRequestparam({
    this.userId,
    this.event_id,
    this.status,
    this.page = 1,
    this.limit = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      if (userId != null) 'user_id': this.userId,
      if (event_id != null) 'event_id': this.event_id,
      if (status != null) 'status': this.status,
      'page': this.page,
      'limit': this.limit,
    };
  }
}
