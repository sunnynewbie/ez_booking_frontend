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
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    return GetBuilder(
      init: EventReviewController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Reviews'),
        ),
        body: _.loading.value
            ? const ReviewShimmer()
            : _.reviews.isEmpty
                ? const NotFound(imgPath: AppAssets.group, text: 'No Reviews')
                : SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    onLoading: () async {
                      _.page++;
                      await _.getEventreview();
                      _refreshController.loadComplete();
                    },
                    onRefresh: () async {
                      _.page=1;
                      await _.getEventreview();
                      _refreshController.refreshCompleted();
                    },
                    child: ListView.separated(
                        padding: const EdgeInsets.only(
                          left: AppDimens.space15,
                          right: AppDimens.space15,
                          top: AppDimens.space15,
                        ),
                        itemBuilder: (context, index) {
                          var item = _.reviews.elementAt(index);
                          return ReviewItem(item: item);
                        },
                        separatorBuilder: (context, index) {
                          return const Gap(AppDimens.space15);
                        },
                        itemCount: _.reviews.length),
                  ),
      ),
    );
  }
}
