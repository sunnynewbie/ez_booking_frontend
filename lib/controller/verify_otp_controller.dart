import 'dart:async';

import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/features/login/service/verify_otp_service.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final ApiService _apiService = ApiService();
  RxString otpString = ''.obs;
  RxBool isLoading = false.obs; // Loading state
  Rxn<UserModel>? userModel = Rxn();
  var ctrl = TextEditingController();
  Timer? timer;
  var timerCount = RxInt(60);

  Future<void> verifyOtp() async {
    isLoading.value = true; // Start loading
    var response = await ApiRepository().verifyOtp({
      'otp': ctrl.text.trim(),
      'phone_no': userModel!.value!.phone_no,
    });
    isLoading.value = false;
    if (response.status) {
      await PrefUtils().setUser(response.data!);
      Get.offNamedUntil(
        RouteConfig.bottomNavBar,
        (route) => false,
      );
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }
  }

  @override
  void onInit() {
    var arg = Get.arguments as UserModel?;
    if (arg != null) {
      userModel!.value = arg;
    }
    super.onInit();
    startTimer();
    otpString.value=userModel?.value?.otp??'';
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  startTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timerCount.value == 1) {
          timer?.cancel();
        }
        timerCount -= 1;
      },
    );
  }

  Future<void> sendOtp() async {
    isLoading.value = true;
    var response =
    await ApiRepository().sendOTP({"phone_no": userModel!.value!.phone_no});
    isLoading.value = false;
    if (response.status) {
      userModel!.value = response.data;
      timerCount.value=60;
      startTimer();
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }
  }
}
