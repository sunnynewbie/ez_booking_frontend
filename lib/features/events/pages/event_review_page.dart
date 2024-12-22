import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/features/events/controller/event_review_controller.dart';
import 'package:ez_booking/features/review/presentation/widget/review_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventReviewPage extends StatelessWidget {
  const EventReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EventReviewController(),
      builder: (_) => Scaffold(
        body: _.loading.value
            ? const ReviewShimmer()
            : ListView.separated(
                itemBuilder: (context, index) {
                  var item =_.reviews.elementAt(index);
                  return const SizedBox();
                },
                separatorBuilder: (context, index) {
                  return const Gap(AppDimens.space15);
                },
                itemCount: _.reviews.length),
      ),
    );
  }
}
