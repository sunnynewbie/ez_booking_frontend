import 'dart:developer';

import 'package:ez_booking/controller/verify_otp_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/features/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  final String phoneNo;
  const VerificationPage({super.key, required this.phoneNo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Initialize the OtpController
    final otpController = Get.put(OtpController());
    final TextEditingController otp = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(92, 251, 222, 255),
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    height: size.height * 0.19,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.55,
                          height: size.width * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  child: const Icon(Icons.arrow_back),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Verify OTP',
                                  style: TextStyle(
                                    fontFamily: AppFont.lexend,
                                    fontSize: size.height * 0.019,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'OTP Sent To XXXXXXXXXX',
                                  style: TextStyle(
                                    fontFamily: AppFont.lexend,
                                    fontSize: size.height * 0.016,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.3,
                          height: size.width * 0.3,
                          child: Image.asset(AppAssets.mobile_password,
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: size.width * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.06),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter The OTP Sent To",
                            style: TextStyle(
                              fontFamily: AppFont.lexend,
                              fontSize: size.height * 0.023,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "+91 XXXXXXXXXX",
                            style: TextStyle(
                              fontFamily: AppFont.lexend,
                              fontSize: size.height * 0.023,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  Container(
                    // color:Colors.red,
                    alignment: Alignment.center,
                    width: size.width * 0.7,
                    child: PinCodeTextField(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: AppFont.lexend,
                      ),
                      appContext: context,
                      length: 6, // Number of OTP fields
                      controller: otp, // Use the TextEditingController
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight:
                              MediaQuery.of(context).size.height * 0.05,
                          fieldWidth: MediaQuery.of(context).size.height * 0.05,
                          activeFillColor: Colors.transparent,
                          activeColor: Colors.black38,
                          selectedFillColor: Colors.transparent,
                          selectedColor: Colors.black87,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: Colors.black38),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (value) {
                        // Debugging - Log the value whenever the OTP changes
                        log("Current OTP: $value");

                        // Update the RxString in the controller whenever the value changes
                        if (value.length <= 6) {
                          otpController.otpString.value =
                              value; // Update the controller's OTP string
                        } else {
                          otpController.otpString.value =
                              value.substring(0, 6); // Limit to 6 digits
                        }

                        log("OTP STRING: ${otpController.otpString.value}");
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width * 0.8,
                    child: Text(
                      "Didn't get the OTP? Resend in 00:30",
                      style: TextStyle(
                        fontFamily: AppFont.lexend,
                        fontSize: size.height * 0.015,
                        color: Colors.black45,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Obx(()
                  => GestureDetector(
                    child: CustomButtom(
                      text: otpController.isLoading.value ? 'Loading..' : 'Verify OTP' ,
                      // text:  'Verify OTP' ,
                      height: size.height * 0.06,
                      width: size.width * 0.85,
                    ),
                    onTap: () {
                      log("Phone no : " + phoneNo.toString());
                      log("OTP no : " +
                          otpController.otpString
                              .value); // Access the OTP from the controller

                      if (otpController.otpString.value.isNotEmpty) {
                        otpController.verifyOtp(
                            otpController.otpString.value, phoneNo);
                      } else {
                        Get.snackbar("Error", "Please enter the OTP");
                      }
                    },
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
