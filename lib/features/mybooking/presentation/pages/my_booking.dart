import 'package:ez_booking/controller/event_by_category_list.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  int current = 0; // Moved outside the build method for state persistence.

  @override
  Widget build(BuildContext context) {
    List<String> items = ['All', 'Upcoming', 'Cancel', 'Past'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Booking',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme:
            const IconThemeData(color: Colors.black), // For back button color.
      ),
      body: Container(
        padding: EdgeInsets.all(AppDimens.space10),
        child: Column(
          children: [
            // Tab selection section
            Container(
              height: AppDimens.buttonHeight * 1.2,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(5),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: current == index
                            ? AppColors.primary
                            : AppColors.textGrey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                            color: current == index
                                ? Colors.white
                                : AppColors.grey78,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Container(
                      // height: 160,
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(top: AppDimens.space5),
                                    height: AppDimens.imageSize75,
                                    width: AppDimens.imageSize75,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          AppAssets.music_review,
                                          fit: BoxFit.cover,
                                        ))),
                                SizedBox(
                                  width: AppDimens.space12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Group Trekking/Camping'),
                                    Text('Manali uttrakhand(india)'),
                                    Text('₹700')
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.space12,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: AppDimens.space5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppElevatedButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  onTap: () {},
                                  borderColor: AppColors.textGrey,
                                  buttonColor:
                                      AppColors.textGrey.withOpacity(0.2),
                                  borderRadius: 10,
                                  buttonName: 'Leave Review',
                                  fontSize: 14,
                                  fontColor: AppColors.grey78,
                                ),
                                AppElevatedButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  onTap: () {
                                    Get.toNamed('/bookingDetails');
                                  },
                                  buttonColor: AppColors.primary,
                                  borderRadius: 10,
                                  buttonName: 'View Details',
                                  fontSize: 14,
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
