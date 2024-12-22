class PaymentParam {
  int amount;
  String eventName;
  String description;
  String orderId;
  String personName;
  String personNumber;
  int bookingId;
  String sub_booking_id;


  PaymentParam({
    required this.amount,
    required this.eventName,
    required this.description,
    required this.orderId,
    required this.personName,
    required this.personNumber,
    required this.bookingId,
    required this.sub_booking_id,
  });

  Map<String, dynamic> toMap() {

    return {
      'key': 'rzp_test_XlQMZCnikBU8CT',
      'amount': amount*100,
      'name': eventName,
      'order_id':orderId,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      "notes": {
        "sub_id": sub_booking_id,
      }
    };
    return {
      'amount': this.amount,
      'eventName': this.eventName,
      'description': this.description,
      'orderId': this.orderId,
    };
  }

}
