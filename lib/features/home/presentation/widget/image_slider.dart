import 'package:carousel_slider/carousel_slider.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<String> imgList = [
      AppAssets.music_review,
      AppAssets.onboarding_4,
    ];
    return Container(
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
    );
  }
}
