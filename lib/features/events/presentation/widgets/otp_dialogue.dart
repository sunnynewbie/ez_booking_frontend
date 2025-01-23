import 'package:ez_booking/controller/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OTPVerificationDialog extends StatelessWidget {
  const OTPVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyOtpController());

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
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
              controller.verifiactionArgs.phoneNumber,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            Form(
              key: controller.formKey,
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: controller.ctrl,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.transparent,
                  activeColor: Colors.grey[400]!,
                  borderWidth: 1,
                  activeBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  errorBorderWidth: 1,
                  selectedFillColor: Colors.transparent,
                  selectedColor: Colors.grey[400]!,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: Colors.grey[400]!,
                ),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
              ),
            ),
            const Gap(20),
            Obx(
              () => ElevatedButton(
                onPressed: (){},
                child: Text(controller.isLoading.value ? 'Verifying...' : 'Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}