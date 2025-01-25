import 'package:ez_booking/controller/navbar_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/explore_page/explore_page.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/my_booking.dart';
import 'package:ez_booking/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (_) {
      TextStyle getActiveStyle(int index) {
        return context.md14.copyWith(
            color:
                _.tabIndex.value == index ? Colors.white : AppColors.primary);
      }

      return AppScaffold(
        body: SafeArea(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _.pageController,
            onPageChanged: (value) {
              _.tabIndex.value = value;
            },
            children: const [
              HomePage(),
              ExplorePage(),
              MyBooking(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => GNav(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.space10,
              horizontal: AppDimens.space10,
            ),
            activeColor: Colors.white,
            textSize: 12,
            tabMargin: const EdgeInsets.symmetric(
              vertical: AppDimens.space15,
              horizontal: AppDimens.space5,
            ),
            tabs: [
              GButton(
                backgroundColor: AppColors.primary,
                gap: 10,
                textStyle: getActiveStyle(0),
                text: 'Home',
                icon: Icons.add,
                leading: Obx(
                  () => ImageView(
                    imageType: ImageType.asset,
                    height: AppDimens.imageSize20,
                    width: AppDimens.imageSize20,
                    path: _.tabIndex.value == 0
                        ? AppAssets.home_2
                        : AppAssets.home,
                  ),
                ),
              ),
              GButton(
                backgroundColor: AppColors.primary,
                gap: 10,
                textStyle: getActiveStyle(1),
                icon: Icons.abc,
                text: 'Explore',
                leading: ImageView(
                  imageType: ImageType.asset,
                  path: _.tabIndex.value == 1
                      ? AppAssets.discover_2
                      : AppAssets.discover,
                  height: AppDimens.imageSize20,
                  width: AppDimens.imageSize20,
                ),
              ),
              GButton(
                backgroundColor: AppColors.primary,
                gap: 10,
                textStyle: getActiveStyle(2),
                icon: Icons.abc_rounded,
                text: 'My booking',
                leading: ImageView(
                  height: AppDimens.imageSize20,
                  width: AppDimens.imageSize20,
                  imageType: ImageType.asset,
                  path: _.tabIndex.value == 2
                      ? AppAssets.calendar_2
                      : AppAssets.calendar,
                ),
              ),
              GButton(
                backgroundColor: AppColors.primary,
                gap: 10,
                icon: Icons.ac_unit,
                textStyle: getActiveStyle(3),
                text: 'Profile',
                leading: ImageView(
                  height: AppDimens.imageSize20,
                  width: AppDimens.imageSize20,
                  imageType: ImageType.asset,
                  path: _.tabIndex.value == 3
                      ? AppAssets.profile_2
                      : AppAssets.profile,
                ),
              ),
            ],
            style: GnavStyle.google,
            selectedIndex: _.tabIndex.value,
            onTabChange: (value) {
              _.changeTabIndex(value);
            },
          ),
        ),
        /*  bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 60,
          backgroundColor: Colors.white,
          selectedIndex: controller.tabIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: controller.changeTabIndex,
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
        ),
      */
      );
    });
  }
}
