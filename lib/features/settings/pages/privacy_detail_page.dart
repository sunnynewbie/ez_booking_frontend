import 'package:ez_booking/controller/privacy_detail_controller.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyDetailPage extends StatelessWidget {
  const PolicyDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PrivacyDetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('${_.privacyModel?.title ?? ''}'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.space16,
            vertical: AppDimens.space20,
          ),
          child: Obx(
            () => Text('${_.privacy.value?.content ?? ''}'),
          ),
        ),
      ),
    );
  }
}
