import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var userModel = Rxn<UserModel>();
  var phoneCtrl = TextEditingController();

  Future<void> sendOtp() async {
    isLoading.value = true;
    var response =
        await ApiRepository().sendOTP({"phone_no": phoneCtrl.text.trim()});
    isLoading.value = false;
    if (response.status) {
      userModel.value = response.data;
      Get.toNamed(AppRoutes.verification, arguments: response.data);
    } else {
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }
  }
}
