import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/firebase_util.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/features/events/presentation/widgets/otp_dialogue.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'verify_otp_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isskipping = false.obs;
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
        Get.dialog(OTPVerificationDialog(),arguments: verifiactionArgs);
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

  Future<void> createGuestLogin() async {
    isskipping.value=true;
    var deviceId = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      deviceId = androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    }
    var data = {'device_id': deviceId};
    var response = await ApiRepository().createGuestLogin(data);
    isskipping.value=false;
    if (response.status) {
      await PrefUtils().setUser(response.data!);
      Appservice.instance.user.value = response.data;
      if (response.data!.city == null) {
        Get.toNamed(AppRoutes.allowLocation);
        return;
      }
      Get.offNamedUntil(
        AppRoutes.bottomNavBar,
      (route) => false,
      );
    } else {
      ShowToast.showErrorMsg(response.message ?? '');
    }
  }
}
