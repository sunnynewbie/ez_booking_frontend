import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ImageViewer extends StatelessWidget {
  final List<ImageModel> images;

  ImageViewer({super.key, required this.images});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 4,
            controller: pageController,
            itemBuilder: (context, index) {
              var item = 'assets/${[
                'image1.png',
                'image2.png',
                'image3.png'
              ][index % 3]}';
              return InteractiveViewer(
                maxScale: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageView(imageType: ImageType.asset, path: item),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: 300.ms, curve: Curves.linear);
              },
              icon: Icon(
                Icons.arrow_circle_left,
                size: 50,
                color: Colors.grey.withOpacity(.7),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                pageController.nextPage(duration: 300.ms, curve: Curves.linear);
              },
              icon: Icon(
                Icons.arrow_circle_right,
                size: 50,
                color: Colors.grey.withOpacity(.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
