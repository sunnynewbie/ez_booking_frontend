// pages/login_page.dart
import 'package:ez_booking/controller/login_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              AppAssets.Fyndio,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Gap(AppDimens.space10),
                          Text(
                            'Ez booking',
                            style: context.x26.withprimary.weigh700,
                          )
                        ],
                      ),
                      Gap(AppDimens.space50),
                      Text(
                        'Welcome to Ez booking !!',
                        style: context.x20.weigh700,
                      ),
                      SizedBox(
                        height: AppDimens.space10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimens.space30,
                        ),
                        child: Text(
                          'Start your journey,Please enter your phone number.',
                          textAlign: TextAlign.center,
                          style: context.md14.withgrey78,
                        ),
                      ),
                      Gap(AppDimens.space15),
                      AppTextFormField(
                        controller: _.phoneCtrl,
                        label: 'Phone number',
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          if (value.length < 10) {
                            return "Please enter valid phone number";
                          }
                          return null;
                        },
                      ),
                      Gap(AppDimens.space20),
                      Obx(
                        () => AppElevatedButton(
                          isLoading: _.isLoading.value,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              _.sendOtp();
                            }
                          },
                          buttonName: 'Continue',
                          width: double.maxFinite,
                        ),
                      ),
                      Gap(AppDimens.space15),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
