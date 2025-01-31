import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:ez_booking/features/notifications/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationListController>(
        init: NotificationListController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Notifications',
                style: context.lg16.weigh500,
              ),
            ),
            body: SmartRefresher(
              controller: _.rfCtrl,
              onLoading: () async {
                _.page += 1;
               await _.getNotifications();
              _.rfCtrl.loadComplete();
               },
              onRefresh: () async {
                if (_.loading.value) {
                  return;
                }
                _.page = 1;
              await  _.getNotifications();
              _.rfCtrl.refreshCompleted();
              },
              child: Obx(
                () => _.loading.value
                    ? ListView.separated(
                        physics: ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space16),
                        itemBuilder: (context, index) => ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimens.circleRadius10),
                                side: const BorderSide(
                                    color: AppColors.borderColor),
                              ),
                              title: SizedBox().shimmerEffect(
                                height: 14,
                                width: 50,
                              ),
                              subtitle: SizedBox().shimmerEffect(
                                height: 12,
                                width: 120,
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            Gap(AppDimens.space15),
                        itemCount: 5)
                    : ListView.separated(
                        physics: ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space16),
                        itemBuilder: (context, index) {
                          var item = _.notifications.elementAt(index);
                          return ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimens.circleRadius10),
                                side: const BorderSide(
                                    color: AppColors.borderColor),
                              ),
                              title: Text(
                                item.title,
                                style: context.md14.weigh500,
                              ),
                              subtitle: Text(
                                item.body,
                                style: context.sm12,
                              ));
                        },
                        separatorBuilder: (context, index) =>
                            const Gap(AppDimens.space15),
                        itemCount: _.notifications.length,
                      ),
              ),
            ),
          );
        });
  }
}
