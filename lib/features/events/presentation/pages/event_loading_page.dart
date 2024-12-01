import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventLoadingPage extends StatelessWidget {
  const EventLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitCircle(
                color: AppColors.primary,
                size: Get.width / 3,
              ),
              Gap(AppDimens.space20),
              Text(
                '''Don't worry, we're processing your payment securely.
                   We'll notify you once it's complete''',
                style: context.md14.withgrey78,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
