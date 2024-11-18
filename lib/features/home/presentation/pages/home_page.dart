import 'package:carousel_slider/carousel_slider.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/features/home/presentation/widget/all_event_list.dart';
import 'package:ez_booking/features/home/presentation/widget/event_category.dart';
import 'package:ez_booking/features/home/presentation/widget/popular_event.dart';
import 'package:ez_booking/features/home/presentation/widget/recommend_event.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      AppAssets.music_review,
      AppAssets.onboarding_4,
    ];
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      body: SingleChildScrollView(
        // Ensure entire page is scrollable
        child: Column(
          children: [
            // CarouselSlider
            Container(
              height: size.height * 0.24, // Fixed height for the carousel
              child: CarouselSlider(
                options: CarouselOptions(
                  height: size.height * 0.24,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enlargeCenterPage: false,
                ),
                items: imgList.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // GridView wrapped with shrinkWrap and inside a Flexible widget
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: SizedBox(
            //     // No fixed height for the GridView
            //     child: GridView.builder(
            //       shrinkWrap:
            //           true, // Allows the GridView to only take as much space as needed
            //       physics:
            //           NeverScrollableScrollPhysics(), // Disable the grid view scrolling
            //       padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            //       itemCount: 10,
            //       itemBuilder: (ctx, i) {
            //         return Container(
            //           // height: size.height * 0.7,
            //           child: Stack(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.stretch,
            //                 children: [
            //                   Expanded(child: InfoCard()),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         childAspectRatio: 1.0,
            //         crossAxisSpacing: size.width * 0.02,
            //         mainAxisSpacing: size.width * 0.015,
            //         mainAxisExtent: 264,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.01,
            ),
            EventCategory(),
            RecommenededEvent(),
            PopularEvent(),
            AllEvent()
          ],
        ),
      ),
    );
  }
}
