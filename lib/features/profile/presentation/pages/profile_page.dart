import 'package:ez_booking/controller/get_user_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/widget/profile_page_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the UserController
    final UserController userController = Get.put(UserController());

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 10,
        title: Text(
          'Profile',
          style: context.lg16.weigh500,
        ),
      ),
      body: Container(
        child: Obx(() {
          if (userController.isLoading.value) {
            return Center(
                child:
                    const CircularProgressIndicator()); // Show loader when loading
          }
          final user = userController.user.value;

          return RefreshIndicator(
            onRefresh: () async {
              await userController.fetchUserData();
            },
            child: ListView(
              children: [
                ProfileWithAvatarTile(
                    phoneNumber: user?.phone_no ?? '',
                    username: user?.user_name ?? '',
                    name: '${user?.displayName}'),
                NormalTitle(
                  imgPath: AppAssets.bookingIcon,
                  text: 'My Booking',
                  ontap: () {
                    Get.toNamed(AppRoutes.myBooking);
                  },
                ),
                NormalTitle(
                  imgPath: AppAssets.bookingIcon,
                  text: 'My Reviews',
                  ontap: () {
                    Get.toNamed('/review');
                  },
                ),
                NormalTitle(
                  imgPath: AppAssets.reward_icon,
                  text: 'Offers & Rewards',
                  ontap: () {
                    Get.toNamed('/rewardAndOffers');
                  },
                ),
                NormalTitle(
                  imgPath: AppAssets.helpIcon,
                  text: 'Help & Support',
                  ontap: () {},
                ),
                NormalTitle(
                  imgPath: AppAssets.settingIcon,
                  text: 'Settings',
                  ontap: () {
                    Get.toNamed('/settings');
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
