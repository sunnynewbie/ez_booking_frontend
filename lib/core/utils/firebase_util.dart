import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseUtil {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendOtp(
    String phoneNumber, {
    required Function(PhoneAuthCredential credential) verificationCompleted,
    required Function(FirebaseAuthException exception) verificationFailed,
    required void Function(String? verificationId,int? forceResendingToken)
        codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
        int? resendToken,
  }) {
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91 $phoneNumber',
      forceResendingToken: resendToken,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<User?> loginWithPhone(
      {required String verificationId, required String smsCode}) async {
    try {
      PhoneAuthCredential authProvider = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      var response = await _firebaseAuth.signInWithCredential(authProvider);
      if (response.user != null) {
        return response.user;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      ShowToast.showErrorMsg(e.message??'');
    }
  }
}
