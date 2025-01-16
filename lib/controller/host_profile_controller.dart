import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/organizer_model.dart';
import 'package:get/get.dart';

class HostPorfileController extends GetxController {
  Rxn<OrganizerModel> organizer = Rxn(null);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    var orgId = Get.arguments as num?;
    super.onInit();
    if (orgId != null) {
      getOrganizerDetails(orgId);
    }
  }

  getOrganizerDetails(num id) async {
    var response = await ApiRepository().getOrganizerById(id: id);
    if (response.status) {
      organizer.value = response.data;
    } else {

    }
  }
}
