import 'package:ez_booking/controller/policy_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Policypage extends StatelessWidget {
  const Policypage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PolicyController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Privacy policy'),
        ),
        body: Obx(
          () => ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space16,
              vertical: AppDimens.space20,
            ),
            itemBuilder: (context, index) {
              var item = _.privacyList.elementAt(index);
              return ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.policyDetail,arguments: item);
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppDimens.borderRadius10,
                  ),
                ),
                title: Text(item.title),
                trailing: Image.asset(
                  AppAssets.arrowIcon,
                  height: AppDimens.imageSize24,
                  width: AppDimens.imageSize24,
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(AppDimens.space15),
            itemCount: _.privacyList.length,
          ),
        ),
      ),
    );
  }
}
