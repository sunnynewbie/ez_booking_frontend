import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/features/widget/profile_page_tile.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(AppDimens.space5),
        child: Column(
          children: [
            // This Container contains the titles but doesn't wrap the Expanded directly.
            Expanded(
              child: Container(
                // padding: EdgeInsets.all(AppDimens.space10),
                child: Column(
                  children: [
                    NormalTitle(
                      imgPath: AppAssets.reward_icon,
                      text: 'Policies',
                      ontap: () {
                        Get.toNamed(AppRoutes.policies);
                      },
                    ),
                    NormalTitle(
                      imgPath: AppAssets.reward_icon,
                      text: 'About us',
                      ontap: () {},
                    ),
                    if (Appservice.instance.user.value!.user_type ==
                        UserType.user)
                      NormalTitle(
                        imgPath: AppAssets.reward_icon,
                        text: 'Deactivate account',
                        ontap: () {},
                      ),
                  ],
                ),
              ),
            ),
            // The AppLogoutButton is positioned at the bottom.
            Container(
              margin: EdgeInsets.only(
                  bottom: AppDimens.space25,
                  right: AppDimens.space5,
                  left: AppDimens.space5),
              child: AppElevatedButton(
                text:
                    (Appservice.instance.user.value!.user_type == UserType.user)
                        ? 'Logout'
                        : 'Login',
                onTap: () async {
                  await PrefUtils().clear();
                  Get.offNamedUntil(AppRoutes.login, (route) => false);
                },
                buttonColor: Colors.white,
                borderColor: AppColors.black32,
                width: double.maxFinite,
                fontColor: AppColors.black32,
                height: AppDimens.buttonHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
