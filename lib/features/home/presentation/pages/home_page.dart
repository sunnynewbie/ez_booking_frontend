import 'package:carousel_slider/carousel_slider.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      AppAssets.onboarding_1,
      AppAssets.onboarding_4,
      AppAssets.onboarding_2,
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('hello',
                    style: TextStyle(
                        fontSize: size.height * 0.019,
                        fontFamily: AppFont.lexend,
                        fontWeight: FontWeight.w600)),
                Text('Aadesh Kumar',
                    style: TextStyle(
                        fontSize: size.height * 0.028,
                        fontFamily: AppFont.lexend,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                AppAssets.search_normal,
              ),
              onPressed: () {
                print("Search icon tapped");
              },
            ),
            IconButton(
              icon: Image.asset(
                AppAssets.notification,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  viewportFraction: 0.8,
                ),
                items: imgList.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10, // Horizontal spacing between items
                    mainAxisSpacing: 10, // Vertical spacing between items
                  ),
                  itemCount: 3, // Number of items in the grid
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Item ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
