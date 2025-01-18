import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:ez_booking/core/widget/not_found_component.dart';
import 'package:ez_booking/features/review/presentation/widget/review_shimmer.dart';
import 'package:ez_booking/features/search/search_controller.dart';
import 'package:ez_booking/features/search/search_item_widget.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AppSearchController(),
      builder: (_) {
        return AppScaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(
                AppDimens.space45,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.space16,
                ),
                child: AppTextFormField(
                  hint: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  controller: _.searchCtrl,
                  onChange: (value) {
                    _.debouncer.run(() {
                      if (value!.isEmpty) {
                        _.events.clear();
                        _.categories.clear();
                        return;
                      }
                      var data = _.searchCtrl.text.trim();
                      _.searchApi(data);
                    });
                  },
                ),
              ),
            ),
          ),
          body: Obx(
            () => _.isLoading.value
                ? ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.space16)
                        .copyWith(
                      top: AppDimens.space20,
                    ),
                    separatorBuilder: (context, index) =>
                        Gap(AppDimens.space15),
                    itemBuilder: (context, index) => ListtileShimmer(),
                    itemCount: 3,
                  )
                : _.events.isEmpty && _.categories.isEmpty
                    ? const NotFound(
                        imgPath: AppAssets.search, text: 'No data.')
                    : ListView(
                        padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.space16)
                            .copyWith(top: AppDimens.space20),
                        children: [
                          if (_.categories.isNotEmpty) ...[
                            Text(
                              'Categories',
                              style: context.lg16.weigh500,
                            ),
                            ListView.separated(
                              padding:
                                  const EdgeInsets.only(top: AppDimens.space15),
                              itemBuilder: (context, index) {
                                var item = _.categories.elementAt(index);
                                return InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.events,arguments: item.id);
                                },
                                  child: SearchItemWidget(item: item),
                                );
                              },
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const Gap(AppDimens.space15),
                              itemCount: _.categories.length,
                            ),
                          ],
                          if (_.events.isNotEmpty) ...[
                            const Gap(AppDimens.space20),
                            Text(
                              'Events',
                              style: context.lg16.weigh500,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .65,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              padding:
                                  const EdgeInsets.only(top: AppDimens.space15),
                              itemBuilder: (context, index) {
                                var item = _.events.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.eventDetail,
                                        arguments: item.id.toInt());
                                  },
                                  child: InfoCard(
                                    rating: item.average_rating,
                                    totalReviews: item.total_reviews,
                                    eventid: item.id.toInt(),
                                    location: item.address,
                                    eventName: item.name,
                                    eventDate: item.event_date,
                                    organizerName: '${item.organizer?.f_name} ${item.organizer?.l_name}',
                                  ),
                                );
                              },
                              itemCount: _.events.length,
                            ),
                          ],
                          Gap(AppDimens.space20),
                        ],
                      ),
          ),
        );
      },
    );
  }
}
