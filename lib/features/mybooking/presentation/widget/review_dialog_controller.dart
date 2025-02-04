import 'dart:developer';

import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:io';

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
  }

  Future<void> pickImages() async {
    final List<XFile>? images = await imagePicker.pickMultiImage(
      limit: 4,
    );
    if (images != null && images.isNotEmpty) {
      selectedImages.addAll(images);
    }
  }

  writeReview() async {
    loading.value = true;
    
    try {
      final form = dio.FormData.fromMap({
        'rating': rating.value.toString(),
        'message': remarkCtrl.text.trim(),
        'review_by': booking_detailsBean.userid.toString(),
        'event_id': booking_detailsBean.eventId.toString(),
        'booking_id': booking_detailsBean.booking_id.toString(),
      });

      for (int i = 0; i < selectedImages.length; i++) {
        final file = File(selectedImages[i].path);
        final fileName = selectedImages[i].path.split('/').last;
        
        form.files.add(
          MapEntry(
            'images',
            await dio.MultipartFile.fromFile(
              file.path,
              filename: fileName,
            ),
          ),
        );
      }

      var response = await ApiRepository().addReview(param: form);
      
      if (response.status) {
        Get.back(result: true);
      }
      if (response.message != null) {
        log(" add review + " +response.message.toString());
        ShowToast.showMsg(response.message ?? '');
      }
    } catch (e) {
      ShowToast.showErrorMsg('Error uploading review: ${e.toString()}');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    remarkCtrl.dispose();
    super.onClose();
  }
}