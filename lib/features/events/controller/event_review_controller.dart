import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/params/event_review_param.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:get/get.dart';

class EventReviewController extends GetxController {
  RxList<ReviewModel> reviews = RxList.empty();
  int page = 1;
  int limit = 10;
  RxBool loading = RxBool(false);
  late Rx<EventModel> event;

  @override
  void onInit() {
    var args = Get.arguments as EventModel;
    event = Rx(args);
    super.onInit();
    Future.delayed(Duration.zero, () {
      getEventreview();
    });
  }

  Future<void> getEventreview() async {
    loading.value = true;
    EventReviewParam param = EventReviewParam(
        page: page, limit: limit, event_id: event.value.event_id.toInt());
    var response = await ApiRepository().getEventReviews(param);
    loading.value = false;
    if (response.status) {
      reviews.assignAll(response.data ?? []);
    } else {
      if (response.message != null) {
        ShowToast.showErrorMsg( response.message ?? '');
      }
    }
  }
}
