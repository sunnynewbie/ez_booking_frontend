import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/utils/firebase_util.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'verify_otp_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var userModel = Rxn<UserModel>();
  var phoneCtrl = TextEditingController();

  Future<void> sendOtp() async {
    isLoading.value = true;
    var phonNumber = '${phoneCtrl.text.trim()}';
    FirebaseUtil().sendOtp(
      phonNumber,
      codeAutoRetrievalTimeout: (verificationId) {
        isLoading.value = false;
      },
      codeSent: (verificationId, forceResendingToken) {
        isLoading.value = false;
        VerifiactionArgs verifiactionArgs = VerifiactionArgs(
            verification_id: verificationId,
            resendToken: forceResendingToken,
            phoneNumber: phonNumber);
        Get.toNamed(AppRoutes.verification, arguments: verifiactionArgs);
      },
      verificationCompleted: (credential) {
        isLoading.value = false;
      },
      verificationFailed: (exception) {
        isLoading.value = false;
      },
    );
    /*var response =
        await ApiRepository().sendOTP({"phone_no": phoneCtrl.text.trim()});
    isLoading.value = false;
    if (response.status) {
      userModel.value = response.data;
      Get.toNamed(AppRoutes.verification, arguments: response.data);
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }*/
  }
}
