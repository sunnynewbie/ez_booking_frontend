// {
// "booking_id": [19,20,21],
// "event_id": 21, // Replace with the actual event ID
// "user_id": 4, // Replace with the actual user ID
// "booked_by_id": 4, // Replace with the actual booked by ID
// "event_type": 1, // As specified
// "transaction_id": "transaction_id-123",
// "transaction_json": "{\"id\": 1}",
// "payment_status": 1,
// "booking_status": "booked"
// }

class UpadatePaymentParam {
  List<int> booking_id;
  int event_id;
  int user_id;
  int booked_by_id;
  int event_type;
  String transaction_id;
  String transaction_json;
  int payment_status;
  String booking_status;

  UpadatePaymentParam({
    required this.booking_id,
    required this.event_id,
    required this.user_id,
    required this.booked_by_id,
    required this.event_type,
    required this.transaction_id,
    required this.transaction_json,
    required this.payment_status,
    required this.booking_status,
  });

  Map<String, dynamic> toMap() {
    return {
      'booking_id': this.booking_id,
      'event_id': this.event_id,
      'user_id': this.user_id,
      'booked_by_id': this.booked_by_id,
      'event_type': this.event_type,
      'transaction_id': this.transaction_id,
      'transaction_json': this.transaction_json,
      'payment_status': this.payment_status,
      'booking_status': this.booking_status,
    };
  }
}
