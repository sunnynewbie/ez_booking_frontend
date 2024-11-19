import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/controller/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Reusable ImageChangerWidget
class ImageChangerWidget extends StatelessWidget {
  final ImageController controller;

  const ImageChangerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Main Image Display
        Stack(
          children: [
            // Main Image
            Obx(() => Container(
                  padding: EdgeInsets.only(
                      left: size.height * 0.02,
                      right: size.height * 0.02,
                      bottom: size.height * 0.013),
                  width: size.width,
                  height: size.height * 0.29, // Adjust size as needed
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      controller.imageList[controller.currentIndex.value],
                      fit: BoxFit.cover,
                      key: ValueKey<int>(controller
                          .currentIndex.value), // Reloads image on index change
                    ),
                  ),
                )),
            // Top-Right Overlay with Organizer Name and Event Name
            Positioned(
              top: size.height * 0.013,
              right: size.height * 0.03,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                  vertical: size.height * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Organized by', // Replace with dynamic organizer name
                      style: AppTextStyle.regular
                    ),
                    Text(
                      'Camp Monk', // Replace with dynamic event name
                      style: AppTextStyle.regular
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Thumbnails Row
        Container(
          height: size.height * 0.08, // Height of the thumbnails container
          padding: EdgeInsets.only(
            left: size.height * 0.01,
            right: size.height * 0.01,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.imageList.length,
            itemBuilder: (context, index) {
              return Obx(() {
                bool isSelected = controller.currentIndex.value == index;

                return GestureDetector(
                  onTap: () =>
                      controller.changeMainImage(index), // Update on tap
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(
                                  color: Colors
                                      .blue,
                                  width: 2,
                                )
                              : null, // No border for unselected
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          controller.imageList[index],
                          width: size.width * 0.2, // Thumbnail width
                          height: size.height * 0.12, // Thumbnail height
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
