import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/not_found_component.dart';
import 'package:ez_booking/features/events/controller/event_review_controller.dart';
import 'package:ez_booking/features/review/presentation/pages/review_item.dart';
import 'package:ez_booking/features/review/presentation/widget/review_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class EventReviewPage extends StatelessWidget {
  const EventReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController(initialRefresh: false);
    
    return GetBuilder<EventReviewController>(
      init: EventReviewController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reviews'),
          ),
          body: Obx(() {
            // Check if loading
            if (controller.loading.value) {
              return const ReviewShimmer();
            }
            
            // Check if reviews is null or empty
            if (controller.reviews == null || controller.reviews.isEmpty) {
              return const NotFound(
                imgPath: AppAssets.group,
                text: 'No Reviews',
              );
            }
            
            // Show reviews list
            return SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onLoading: () async {
                controller.page++;
                await controller.getEventreview();
                refreshController.loadComplete();
              },
              onRefresh: () async {
                controller.page = 1;
                await controller.getEventreview();
                refreshController.refreshCompleted();
              },
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: AppDimens.space15,
                  right: AppDimens.space15,
                  top: AppDimens.space15,
                ),
                itemBuilder: (context, index) {
                  final item = controller.reviews[index];
                  return ReviewItem(item: item);
                },
                separatorBuilder: (context, index) {
                  return const Gap(AppDimens.space15);
                },
                itemCount: controller.reviews.length,
              ),
            );
          }),
        );
      },
    );
  }
}