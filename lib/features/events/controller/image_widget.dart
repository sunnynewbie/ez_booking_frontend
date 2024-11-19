import 'package:ez_booking/core/config/app_assets.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  final List<String> imageList = [
    AppAssets.onboarding_1,
    AppAssets.onboarding_3,
    AppAssets.onboarding_2,
    AppAssets.onboarding_4,
    AppAssets.onboarding_5,
  ];

  // Observable index for the currently selected image
  RxInt currentIndex = 0.obs;

  // Method to update the main image index
  void changeMainImage(int index) {
    currentIndex.value = index;
    print("Main Image Index Changed to: $index");
  }
}
