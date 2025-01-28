// pages/login_page.dart
import 'package:ez_booking/controller/login_controller.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_icon.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          return AppScaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              actions: [
                Obx(
                  () => AppElevatedButton(
                    width: 80,
                    borderRadius: AppDimens.borderRadius15,
                    borderColor: const Color.fromARGB(210, 210, 210, 210),
                    buttonColor: const Color.fromARGB(210, 210, 210, 210),
                    onTap: () async {
                      await _.createGuestLogin();
                    },
                    isLoading: _.isskipping.value,
                    text: 'Skip',
                    fontColor: Colors.black,
                    fontSize: AppDimens.space12,
                    height: AppDimens.space35,
                  ),
                ),
                const Gap(AppDimens.space10),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        AppIcon(),
                        Gap(AppDimens.space50),
                        Text(
                          'Welcome to Ezbook!!',
                          style: context.x24.weigh600,
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
                            style: context.md14.weigh500.withgrey78,
                          ),
                        ),
                        Gap(AppDimens.space15),
                      ],
                    ),
                    Column(
                      children: [
                        AppTextFormField(
                          controller: _.phoneCtrl,
                          label: 'Phone number',
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
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
                            text: 'Continue',
                            width: double.maxFinite,
                          ),
                        ),
                        Gap(AppDimens.space15),
                      ],
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
