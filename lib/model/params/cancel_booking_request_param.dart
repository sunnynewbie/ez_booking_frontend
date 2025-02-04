class CancelBookingParam{
  int id;
  int user_id;

  CancelBookingParam({
    required this.id,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'user_id': this.user_id,
    };
  }

}