import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RequestCallbackButton extends StatelessWidget {
  final String? amount;

  const RequestCallbackButton({super.key, this.amount});

  void _showLoginDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button and back icon row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              const Gap(AppDimens.space20),
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
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                    ),
                  ),
                ],
              ),
              const Gap(AppDimens.space22),
              AppElevatedButton(
                text: 'Continue',
                width: double.infinity,
                height: 48,
                buttonColor: const Color(0xFF1A1F37),
                borderRadius: 8,
                onTap: () {
                  Get.back();
                  Get.snackbar(
                    'Success',
                    'Login successful',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.black54,
    );
  }

  void handleRequestCallback(BuildContext context) {
    if (Appservice.instance.user.value!.user_type == UserType.guest) {
      _showLoginDialog(context);
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
