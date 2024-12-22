import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:ez_booking/model/params/add_review_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'write_review_dialog.dart';

class ReviewDialogController extends GetxController {
  var remarkCtrl = TextEditingController();
  RxDouble rating = RxDouble(0);
  ReviewArgs booking_detailsBean;
  RxBool loading = RxBool(false);
  var formKey = GlobalKey<FormState>();

  ReviewDialogController({required this.booking_detailsBean});

  @override
  void onInit() {
    super.onInit();
    // rating.value=booking_detailsBean
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
      Get.snackbar(AppConstant.appName, response.message ?? '');
    }
  }
}
