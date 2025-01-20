import 'dart:developer';

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
      log("ID IS " + id.toString());
    
    if (response.status) {
      log(response.toString());
      organizer.value = response.data;
    } else {

    }
  }
}
