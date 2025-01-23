import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/event_and_reviews_model.dart';
import 'package:ez_booking/model/organizer_model.dart';
import 'package:get/get.dart';

class HostProfileController extends GetxController {
  Rxn<OrganizerModel> organizer = Rxn(null);
  Rxn<EventAndReviewModel> eventsReviews = Rxn(null);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    var orgId = Get.arguments as num?;
    super.onInit();
    if (orgId != null) {
      Future.wait(
          [getOrganizerDetails(orgId), eventAndReviewsByOrganizer(orgId)]);
    }
  }

  Future<void> getOrganizerDetails(num id) async {
    var response = await ApiRepository().getOrganizerById(id: id);
    if (response.status) {
      organizer.value = response.data;
    } else {}
  }

  Future<void> eventAndReviewsByOrganizer(num id) async {
    var response =
        await ApiRepository().eventAndReviewsByOrganizer(organizerId: id);
    if (response.status) {
      eventsReviews.value = response.data;
    } else {}
  }
}
