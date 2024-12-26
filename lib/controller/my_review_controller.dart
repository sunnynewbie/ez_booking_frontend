import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:get/get.dart';

class MyreviewController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<ReviewModel> reviews = RxList.empty();
  int page = 1;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero,() {
      getReviews();
    });
  }

  getReviews() async {
    if (page == 1) {
      loading.value = true;
    }
    var response = await ApiRepository().getReviews();
    loading.value=false;
    if (response.status) {
      reviews.assignAll(response.data ?? []);
    } else {
      ShowToast.showErrorMsg( response.message ?? '');
    }
  }
}
