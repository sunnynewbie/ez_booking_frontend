import 'package:ez_booking/controller/verify_otp_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_icon_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  // final String phoneNo;
  const VerificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyOtpController>(
      init: VerifyOtpController(),
      builder: (_) => SafeArea(
        child: AppScaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.maxFinite, 120),
            child: ColoredBox(
              color: AppColors.grey0f,
              child: Row(
                children: [
                  Expanded(
                    child: AppBar(
                      backgroundColor: AppColors.grey0f,
                      leading: AppIconButton(
                        borderColor: Colors.transparent,
                        imagePath: AppAssets.backIcon,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size(double.maxFinite, 20),
                        child: Container(
                          width: double.maxFinite,
                          padding:
                              const EdgeInsets.only(left: AppDimens.space20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Verify OTP',
                              ),
                              Gap(AppDimens.space40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const ImageView(
                      imageType: ImageType.asset,
                      path: AppAssets.mobile_password),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              right: AppDimens.space15,
              bottom: AppDimens.space30,
              left: AppDimens.space15,
            ),
            child: Form(
              key: _.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(AppDimens.space30),
                  Text(
                    "Enter The OTP Sent To",
                    style: context.lg16,
                  ),
                  Text(
                    _.verifiactionArgs.phoneNumber,
                    style: context.xl18.weigh700,
                  ),
                  const Gap(AppDimens.space20),
                  Container(
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
                          fieldHeight: AppDimens.imageSize50,
                          fieldWidth: AppDimens.imageSize50,
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
                  const Gap(AppDimens.space5),
                  Obx(
                    () => Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Didn't get the OTP? "),
                            if (_.timerCount.value == 0)
                              TextSpan(
                                text: 'Send',
                                style: context.md14.blackunderLine,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _.ctrl.clear();
                                    _.sendOtp();
                                  },
                              )
                            else
                              TextSpan(
                                  text:
                                      'Resend in 00:${_.timerCount.value.toString().padLeft(2, '0')}'),
                          ],
                        ),
                        style: context.md14.withgrey78),
                  ),
                  const Gap(AppDimens.space20),
                  Obx(
                    () => AppElevatedButton(
                      width: double.maxFinite,
                      onTap: () {
                        if (_.formKey.currentState!.validate()) {
                          _.verifyOtp();
                        }
                      },
                      isLoading: _.isLoading.value,
                      text: 'Verify OTP',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
