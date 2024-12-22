import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/model/privacy_content_model.dart';
import 'package:ez_booking/model/privacy_model.dart';
import 'package:get/get.dart';

class PrivacyDetailController extends GetxController {
  PrivacyModel? privacyModel;
  Rxn<PrivacyContentModel> privacy = Rxn();

  Future<void> getDetail() async {
    var response =
        await ApiRepository().getPolicyContent(privacyModel!.id.toInt());
    if (response.status) {
      privacy.value = response.data;
    }
  }

  @override
  void onInit() {
    var item = Get.arguments as PrivacyModel?;
    if (item != null) {
      privacyModel = item;
    }
    super.onInit();
    if (privacyModel != null) {
      Future.delayed(Duration.zero, () {
        getDetail();
      });
    }
  }
}
