import 'package:ez_booking/controller/navbar_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/widget/app_bottomnavbar.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/navbar/presentation/pages/temp.dart';
import 'package:ez_booking/features/profile/presentation/pages/profile_page.dart';
import 'package:ez_booking/features/rewards_and_offer/presentation/pages/reward_and_offer.dart';
import 'package:ez_booking/features/settings/presentation/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<NavBarController>(builder: (controller){
      return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index:  controller.tabIndex.clamp(0, 3),
          children: [
            HomePage(),
            Settings(),
            RewardAndOffer(),
            
            ProfilePage()
          ],
        ),
      ),
      bottomNavigationBar: CustomAnimatedBottomBar(
      containerHeight: 60,
      backgroundColor: Colors.white,
      selectedIndex: controller.tabIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: controller.changeTabIndex ,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          imgPath: AppAssets.home,
      imgPathSelected: AppAssets.home,
          title: Text('Home'),
          activeColor: AppColors.primary,
          inactiveColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          
          imgPath: AppAssets.discover,
      imgPathSelected: AppAssets.discover_2,
          title: Text('Explore'),
          activeColor: AppColors.primary,
          inactiveColor: AppColors.textGrey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          
          imgPath: AppAssets.calendar,
      imgPathSelected: AppAssets.calendar_2,
          title: Text(
            'My Booking ',
          ),
          activeColor: AppColors.primary,
          inactiveColor: AppColors.textGrey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          
          imgPath: AppAssets.profile,
      imgPathSelected: AppAssets.profile_2,
          title: Text('Profile'),
          activeColor: AppColors.primary,
          inactiveColor: AppColors.textGrey,
          textAlign: TextAlign.center,
        ),
      ],
    )
    );
    } );
    
  }
}