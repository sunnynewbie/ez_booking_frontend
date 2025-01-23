import 'dart:developer';

import 'package:ez_booking/controller/login_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RequestCallbackButton extends StatelessWidget {
  final String? amount;
  final LoginController loginController = Get.put(LoginController()); 

  RequestCallbackButton({super.key, this.amount});

  void _showLoginDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    
                    onTap: () {
                      loginController.phoneCtrl.clear();
                      Get.back();
                    },
                    child: const Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(AppDimens.space5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(170, 210, 210, 210),
                    width: 1.3
                  )
                ),
                height: AppDimens.space40,
                width: AppDimens.space40,
                child: Image.asset(AppAssets.login),
              ),
              const Gap(AppDimens.space10),
              Text(
                'Log in to your account',
                style: context.xl18.weigh600,
              ),
              const Gap(AppDimens.space8),
              Text(
                'Welcome back! Please enter your details.',
                textAlign: TextAlign.center,
                style: context.md14.withgrey78,
              ),
              Gap(AppDimens.space22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number',
                    style: context.md14.weigh500,
                  ),
                  const Gap(AppDimens.space8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: TextFormField(
                      controller: loginController.phoneCtrl,
                      decoration: InputDecoration(
                        hintText: 'Enter your Phone number',
                        hintStyle: context.md14.withgrey78,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      style: context.md14,
                      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                    ),
                  ),
                ],
              ),
              const Gap(AppDimens.space22),
              Obx(() => AppElevatedButton(
                text: loginController.isLoading.value ? 'Sending...' : 'Continue',
                width: double.infinity,
                height: AppDimens.buttonHeight,
                buttonColor: AppColors.primary,
                borderRadius: 15,
                onTap: loginController.isLoading.value 
                  ? null 
                  : () {
                    if (loginController.phoneCtrl.text.trim().length == 10) {
                      loginController.sendOtp();
                    } else {
                      Get.snackbar('Error', 'Please enter a valid 10-digit phone number');
                    }
                  },
              )),
            ],
          ),
        ),
      ),
      barrierColor: Colors.black54,
      barrierDismissible: false
    );
  }

  void handleRequestCallback(BuildContext context) {
    final fname = Appservice.instance.user.value?.f_name;
    final lname = Appservice.instance.user.value?.l_name;
    log("Current user id: $fname");
    
    if (fname == "name name" || lname == "laname") {
      _showLoginDialog(context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppDimens.space16,
        right: AppDimens.space16,
        bottom: AppDimens.space20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(AppDimens.space10),
          AppElevatedButton(
            height: AppDimens.buttonHeight,
            width: double.infinity,
            text: 'Request Callback',
            onTap: () => handleRequestCallback(context),
            buttonColor: AppColors.darkBlue,
          ),
          const Gap(AppDimens.space5),
          Text(
            'Usually Response in 3-4 hours',
            style: context.sm12.withgrey78,
          ),
        ],
      ),
    );
  }
}