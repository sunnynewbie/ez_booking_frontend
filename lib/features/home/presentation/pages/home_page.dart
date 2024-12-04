import 'package:ez_booking/controller/home_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/core/widget/app_icon_button.dart';
import 'package:ez_booking/core/widget/notify_box.dart';
import 'package:ez_booking/features/home/presentation/widget/all_event_list.dart';
import 'package:ez_booking/features/home/presentation/widget/event_category.dart';
import 'package:ez_booking/features/home/presentation/widget/home_shimmer_widget.dart';
import 'package:ez_booking/features/home/presentation/widget/image_slider.dart';
import 'package:ez_booking/features/home/presentation/widget/popular_event.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (ctrl) => Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                titleSpacing: AppDimens.space15,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hello,',
                      style: context.lg16,
                    ),
                    Text(
                      'Aadesh Kumar',
                      style: context.x20.weigh500,
                    ),
                  ],
                ),
                actions: [
                  AppIconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.search);
                    },
                    imagePath: AppAssets.search_normal,
                    iconSize: 20,
                    constraints: BoxConstraints(),
                    shrinkButton: true,
                  ),
                  AppIconButton(
                    onPressed: () {},
                    imagePath: AppAssets.notification,
                    iconSize: 20,
                    constraints: BoxConstraints(),
                    shrinkButton: true,
                  ),
                  AppIconButton(
                    onPressed: () {
                      Get.toNamed('/profile');
                    },
                    imagePath: '',
                    constraints: BoxConstraints(),
                    shrinkButton: true,
                    iconColor: AppColors.black32,
                    child: Icon(
                      Icons.person_outlined,
                      size: AppDimens.imageSize25,
                      color: AppColors.black32,
                    ),
                  ),
                ],
                toolbarHeight: 75,
                bottom: PreferredSize(
                  preferredSize: Size(double.maxFinite, AppDimens.space15),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: AppDimens.space16,
                        right: AppDimens.space5,
                        top: AppDimens.space5,
                        bottom: AppDimens.space5),
                    decoration: BoxDecoration(color: AppColors.primary),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'data',
                            style: context.md14.withWhite,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ctrl.isLoading.value
                    ? const HomeShimmerWidget()
                    : Column(
                        children: [
                          // CarouselSlider
                          ImageSlider(),
                          Gap(AppDimens.space10),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.space16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                EventCategory(
                                  categories: ctrl.categories,
                                ),
                              ],
                            ),
                          ),
                          const Gap(AppDimens.space15),
                          const NotifyBox(
                            text1: 'Book now & Get ₹ 100 cashback',
                            text2: 'Book any events and get 100 as a bonus',
                            text3: 'Book Now',
                            boxColor: Colors.white,
                            imgPath: AppAssets.coconutTree,
                          ),
                          if (ctrl.dashboard.value != null) ...[
                            Gap(AppDimens.space15),
                            AllEvent(
                              dashboardModel: ctrl.dashboard.value!,
                            ),
                            PopularEvent(
                              dashboardModel: ctrl.dashboard.value!,
                            ),
                          ],
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded edges
          ),
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red), // Red border
                foregroundColor: Colors.red, // Text color
              ),
              onPressed: () async {
                await PrefUtils().clear();
                Get.offAllNamed('/login'); // Navigate to LoginPage using GetX
              },
              child: const Text('Logout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
