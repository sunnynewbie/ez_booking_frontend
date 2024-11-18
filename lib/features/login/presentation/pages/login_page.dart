// pages/login_page.dart
import 'package:ez_booking/controller/sendotp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/features/login/presentation/pages/verifiation_page.dart';
import 'package:ez_booking/features/widget/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final LoginController loginController = Get.put(LoginController());
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: size.height * 0.15),
            height: size.height * 0.5,
            width: size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.13,
                      height: size.width * 0.13,
                      child: Image.asset(
                        AppAssets.Fyndio,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      'Fyndio',
                      style: TextStyle(
                          fontFamily: AppFont.lexend,
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Welcome back to Fyndio !!',
                  style: TextStyle(
                    fontFamily: AppFont.lexend,
                    fontSize: size.height * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.011,
                ),
                Container(
                  width: size.width * 0.9,
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur. Nisi arcu sed nec ut est. Nibh ut aliquet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFont.lexend,
                      fontSize: size.height * 0.018,
                      color: Colors.black45,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.026,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppFont.lexend,
                            fontSize: size.height * 0.021,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26, width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: phoneController,
                          cursorColor: AppColors.primary,
                          style: TextStyle(color: AppColors.primary),
                          decoration: InputDecoration(
                            hintText: 'Enter phone number',
                            hintStyle: TextStyle(color: Colors.black45),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                Obx(
                  () => GestureDetector(
                    child: CustomButtom(
                      text: loginController.isLoading.value
                          ? "Loading..."
                          : "Continue",
                      height: size.height * 0.06,
                      width: size.width * 0.82,
                    ),
                    onTap: () {
                      if (!loginController.isLoading.value) {
                        loginController.loginUser(phoneController.text);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppFont.lexend,
                          fontSize: size.height * 0.019,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerificationPage(
                                  phoneNo: phoneController.text.toString(),
                                )));
                      },
                      child: Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppFont.lexend,
                          fontSize: size.height * 0.019,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
