import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/app_logout_button.dart';
import 'package:ez_booking/features/widget/profile_page_tile.dart';
import 'package:flutter/material.dart';

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
                      ontap: () {},
                    ),
                    NormalTitle(
                      imgPath: AppAssets.reward_icon,
                      text: 'About us',
                      ontap: () {},
                    ),
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
              margin: EdgeInsets.only(bottom: AppDimens.space25, right: AppDimens.space5, left: AppDimens.space5 ),
              child: AppLogoutButton(
                text: 'Logout',
                height: AppDimens.buttonHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
