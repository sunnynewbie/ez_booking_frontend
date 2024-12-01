import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayUtil {
  Razorpay razorpay = Razorpay();

  startCheckOut(Map<String,dynamic> options) {
    razorpay.open(options);
  }


}
