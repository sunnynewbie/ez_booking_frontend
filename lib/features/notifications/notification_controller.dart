import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NotificationListController extends GetxController {
  RxList<NotificationModel> notifications = RxList.empty();
  int page = 1;
  int limit = 10;
  RxBool loading=RxBool(false);
  RefreshController rfCtrl=RefreshController();

  Future<void> getNotifications() async {
    loading.value=true;
    var response = await ApiRepository().getNotificationList();
    if (response.status) {
      if (page == 1) {
        notifications.assignAll(response.data ?? []);
      } else {
        notifications.addAll(response.data ?? []);
      }
    } else {
      ShowToast.showErrorMsg(response.message ?? '');
    }
    loading.value=false;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      getNotifications();
    });
  }
}
