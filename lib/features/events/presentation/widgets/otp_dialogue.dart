import 'package:ez_booking/controller/verify_otp_controller.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OTPVerificationDialog extends StatelessWidget {
  const OTPVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(VerifyOtpController());

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding:
      const EdgeInsets.symmetric(horizontal: AppDimens.space5),
      content: SizedBox(
        width: Get.width * .8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, size: 24),
                ),
              ],
            ),
            Text(
              "Enter The OTP Sent To",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(8),
            Text(
              _.verifiactionArgs.phoneNumber,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            Form(
              key: _.formKey,
            child:  Container(
                alignment: Alignment.center,
                child: PinCodeTextField(
                  textStyle: context.xl18,
                  appContext: context,
                  length: 6,
                  // Use the TextEditingController
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: AppDimens.space40,
                          fieldWidth: AppDimens.space40,
                          activeFillColor: Colors.transparent,
                          activeColor: AppColors.greyd2,
                          borderWidth: .5,
                          activeBorderWidth: .5,
                          inactiveBorderWidth: .5,
                          errorBorderWidth: .5,
                          selectedFillColor: Colors.transparent,
                          selectedColor: AppColors.greyd2,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: AppColors.greyd2),
                  controller: _.ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter OTP';
                    }
                    if (value!.length < 6) {
                      return 'Please enter valid OTP';
                    }
                    return null;
                  },
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                ),
              ),
            ),
            const Gap(20),
            Obx(
              () => AppElevatedButton(
                onTap:  (){
                  _.verifyOtp(fromDialog: true);
                },
                width: double.maxFinite,
                childWidget: _.isLoading.value ? const CircularProgressIndicator( color: Colors.white,): Text('Verify', style: const TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}