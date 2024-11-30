import 'package:ez_booking/controller/home_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/core/widget/notify_box.dart';
import 'package:ez_booking/features/home/presentation/widget/all_event_list.dart';
import 'package:ez_booking/features/home/presentation/widget/event_category.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.005),
                Text('hello,',
                    style: TextStyle(
                        fontSize: size.height * 0.019,
                        fontFamily: AppFont.lexend,
                        fontWeight: FontWeight.w500)),
                Text('Aadesh Kumar',
                    style: TextStyle(
                        fontSize: size.height * 0.027,
                        fontFamily: AppFont.lexend,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: size.height * 0.005),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: SizedBox(
                width: 24, // Set the desired width
                height: 24, // Set the desired height
                child: Image.asset(
                  AppAssets.search_normal,
                  fit: BoxFit
                      .contain, // Ensures the image fits within the defined box
                ),
              ),
              onPressed: () {
                print("Search icon tapped");
              },
            ),
            IconButton(
              icon: SizedBox(
                width: 24, // Set the desired width
                height: 24, // Set the desired height
                child: Image.asset(
                  AppAssets.notification,
                  fit: BoxFit
                      .contain, // Ensures the image fits within the defined box
                ),
              ),
              onPressed: () {
                print("Notification icon tapped");
              },
            ),
            IconButton(
              icon: const SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.person_3_outlined),
              ),
              onPressed: () {
                 Get.toNamed('/profile');
              },
            ),
          ],
        ),
        body: Obx(
          () => ctrl.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // CarouselSlider
                      ImageSlider(),
                      Gap(AppDimens.space10),
                      EventCategory(
                        categories: ctrl.categories,
                      ),
                      NotifyBox(
                        text1: 'Book now & Get ₹ 100 cashback',
                        text2: 'Book any events and get 100 as a bonus',
                        text3: 'Book Now',
                        gradient1: const Color.fromARGB(230, 36, 99, 176),
                        gradient2: const Color.fromARGB(210, 67, 137, 222),
                        boxColor: Colors.white,
                        imgPath: AppAssets.coconutTree,
                      ),
                      if(ctrl.dashboard.value!=null)...[
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
