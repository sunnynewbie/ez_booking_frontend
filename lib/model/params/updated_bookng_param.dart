class UpdateBookingParam{
  String bookingId;
  String status;

  UpdateBookingParam({
    required this.bookingId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'parent_booking_id': this.bookingId,
      'booking_status': this.status,
    };
  }

}
