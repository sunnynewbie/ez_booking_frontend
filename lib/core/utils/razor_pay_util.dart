import 'dart:developer';

import 'package:ez_booking/model/params/payment_param.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayUtil {
  Function(PaymentSuccessResponse response) onpaymentSuccess;
  Function(PaymentFailureResponse response) onPaymentError;
  Function(ExternalWalletResponse response) onExternalWallet;



  Razorpay _razorpay = Razorpay();

  startCheckOut(PaymentParam options) {
    _razorpay.open(options.toMap());

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('message ${response.data}');
    log('message ${response.orderId}');
    log('message ${response.paymentId}');
    log('message ${response.signature}');
    onpaymentSuccess(response);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('message${response.message}');
    log('message${response.code}');
    log('message${response.error}');
    onPaymentError(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('message${response.walletName}');
    onExternalWallet(response);
  }

  RazorPayUtil({
    required this.onpaymentSuccess,
    required this.onPaymentError,
    required this.onExternalWallet,
  });
}
