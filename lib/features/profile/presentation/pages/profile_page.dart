import 'package:ez_booking/controller/get_user_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/features/widget/profile_page_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the UserController
    final UserController userController = Get.put(UserController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white
      ),
      body: Container(
        child: Obx(() {
          if (userController.isLoading.value) {
            return Center(child: const CircularProgressIndicator()); // Show loader when loading
          } else if (userController.user.value != null) {
            final user = userController.user.value!;

            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ProfileWithAvatarTile(username: user.user_name, name: user.name),
                    NormalTitle(imgPath: AppAssets.bookingIcon, text: 'My Booking'),
                    NormalTitle(imgPath: AppAssets.bookingIcon, text: 'My Reviews'),
                    NormalTitle(imgPath: AppAssets.reward_icon, text: 'Offers & Rewards'),
                    NormalTitle(imgPath: AppAssets.helpIcon, text: 'Help & Support'),
                    NormalTitle(imgPath: AppAssets.settingIcon, text: 'Settings')
                  ],
                )
              ),
            );
          } else {
            return const Text('Failed to load user data'); 
          }
        }),
      ),
    );
  }
}