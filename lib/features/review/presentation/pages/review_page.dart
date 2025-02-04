import 'package:ez_booking/controller/my_review_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/not_found_component.dart';
import 'package:ez_booking/features/review/presentation/pages/review_item.dart';
import 'package:ez_booking/features/review/presentation/widget/review_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MyreviewController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            'My Reviews',
            style: context.lg16.weigh500,
          ),
          backgroundColor: Colors.white,
        ),
        body: Obx(
          () => _.loading.value
              ? ReviewShimmer()
              : _.reviews.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.space15,
                        horizontal: AppDimens.space15,
                      ),
                      itemBuilder: (context, index) {
                        var item = _.reviews.elementAt(index);
                        return ReviewItem(item: item);
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(AppDimens.space15);
                      },
                      itemCount: _.reviews.length)
                  : const NotFound(
                      imgPath: AppAssets.group, text: 'No Reviews '),
        ),
      ),
    );
  }
}
