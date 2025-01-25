import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/params/add_review_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
    AddReviewParam param = AddReviewParam(
        rating: rating.value,
        message: remarkCtrl.text.trim(),
        review_by: booking_detailsBean.userid.toInt(),
        event_id: booking_detailsBean.eventId.toInt(),
        booking_id: booking_detailsBean.booking_id.toInt());
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
