import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/privacy_model.dart';
import 'package:get/get.dart';

class PolicyController extends GetxController {
  RxList<PrivacyModel> privacyList = RxList.empty();

  Future<void> getPrivacyPolicyList() async {
    var response = await ApiRepository().getPolicies();
    if (response.status) {
      privacyList.assignAll(response.data ?? []);
    }
  }

  @override
  void onInit() {
    super.onInit();
  Future.delayed(Duration.zero,() {
    getPrivacyPolicyList();
  });
  }
}
