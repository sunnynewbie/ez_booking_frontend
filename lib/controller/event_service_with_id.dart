import 'package:carousel_slider/carousel_controller.dart';
import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/params/event_review_param.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  var event = Rxn<EventModel>(); // Holds the event data
  var isLoading = false.obs; // Loading state
  RxList<ReviewModel> reviews = RxList.empty();
  RxString image = RxString('assets/image1.png');
  RxInt currentImage= RxInt(0);
  CarouselSliderController carouselSliderController =CarouselSliderController();
  // Method to fetch event details
  Future<void> fetchEventDetails(int id) async {
    isLoading.value = true;
    var response = await ApiRepository().getEventBYId(id: id);
    isLoading.value = false;
    if (response.status) {
      event.value = response.data;
    }
  }

  Future<void> getReviews(int event_id) async {
    EventReviewParam param =
        EventReviewParam(page: 1, limit: 3, event_id: event_id);
    var response = await ApiRepository().getEventReviews(param);
    if (response.status) {
      reviews.assignAll(response.data ?? []);
    }
  }

  @override
  void onInit() {
    var event_id = Get.arguments as int;
    super.onInit();

    isLoading.value = true;
    Future.wait([fetchEventDetails(event_id), getReviews(event_id)])
        .whenComplete(() {
      isLoading.value = false;
    });
  }
}
