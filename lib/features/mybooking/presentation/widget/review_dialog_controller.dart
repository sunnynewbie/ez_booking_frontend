import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:ez_booking/model/params/add_review_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'write_review_dialog.dart';

class ReviewDialogController extends GetxController {
  var remarkCtrl = TextEditingController();
  RxDouble rating = RxDouble(0);
  ReviewArgs booking_detailsBean;
  RxBool loading = RxBool(false);
  var formKey = GlobalKey<FormState>();
  RxList<XFile> selectedImages = <XFile>[].obs;
  final imagePicker = ImagePicker();

  ReviewDialogController({required this.booking_detailsBean});

  @override
  void onInit() {
    super.onInit();
    // rating.value=booking_detailsBean
  }

  Future<void> checkAndRequestPermissions() async {
    if (GetPlatform.isIOS) {
      final photos = await Permission.photos.request();
      final camera = await Permission.camera.request();
      if (photos.isDenied || camera.isDenied) {
        ShowToast.showErrorMsg('Please enable photo and camera access in settings');
      }
    } else {
      if (await Permission.storage.request().isDenied) {
        ShowToast.showErrorMsg('Please enable storage access in settings');
      }
    }
  }

  Future<void> pickImages() async {
    try {
      await checkAndRequestPermissions();
      
      final List<XFile>? images = await imagePicker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        selectedImages.addAll(images);
      }
    } catch (e) {
      print('Error picking images: $e');
      ShowToast.showErrorMsg('Failed to pick images. Please try again.');
    }
  }

  writeReview() async {
    loading.value = true;
    AddReviewParam param = AddReviewParam(
      rating: rating.value,
      message: remarkCtrl.text.trim(),
      review_by: booking_detailsBean.userid.toInt(),
      event_id: booking_detailsBean.eventId.toInt(),
      booking_id: booking_detailsBean.booking_id.toInt()
    );
    var response = await ApiRepository().addReview(param: param);
    loading.value = false;
    if (response.status) {
      Get.back(result: true);
    }
    if (response.message != null) {
      ShowToast.showErrorMsg(response.message ?? '');
    }
  }

  @override
  void onClose() {
    remarkCtrl.dispose();
    super.onClose();
  }
}