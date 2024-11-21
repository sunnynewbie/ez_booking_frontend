import 'package:ez_booking/controller/verify_otp_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_icon_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
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
    ;
    return GetBuilder<VerifyOtpController>(
      init: VerifyOtpController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, 120),
            child: ColoredBox(
              color: AppColors.grey0f,
              child: Row(
                children: [
                  Expanded(
                    child: AppBar(
                      backgroundColor: AppColors.grey0f,
                      leading: AppIconButton(
                        imagePath: AppAssets.backIcon,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size(double.maxFinite, 20),
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: AppDimens.space20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Verify OTP',
                              ),
                              Obx(
                                () => Text(
                                  'Otp sent to phone number ${_.userModel!.value!.phone_no}',
                                ),
                              ),
                              Gap(AppDimens.space15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ImageView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppDimens.space30),
                Text(
                  "Enter The OTP Sent To",
                  style: context.lg16,
                ),
                Obx(
                  () => Text(
                    "${_.userModel!.value!.phone_no}",
                    style: context.xl18.weigh700,
                  ),
                ),
                Gap(AppDimens.space20),
                Container(
                  alignment: Alignment.center,
                  child: PinCodeTextField(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: AppFont.lexend,
                    ),
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
                        activeColor: Colors.black38,
                        selectedFillColor: Colors.transparent,
                        selectedColor: Colors.black87,
                        inactiveFillColor: Colors.transparent,
                        inactiveColor: Colors.black38),
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
                Gap(AppDimens.space15),
                Obx(
                  () => Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Didn't get the OTP?",
                          ),
                          TextSpan(text: ' Resend in 00:${_.timerCount.value}'),
                        ],
                      ),
                      style: context.md14.withgrey78),
                ),
                Gap(AppDimens.space20),
                Obx(
                  () => AppElevatedButton(
                    width: double.maxFinite,
                    onTap: () {
                      _.verifyOtp();
                    },
                    isLoading: _.isLoading.value,
                    buttonName: 'Verify OTP',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
