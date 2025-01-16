import 'package:ez_booking/controller/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/home/presentation/widget/horizontal_flex.dart';
import 'package:ez_booking/features/home/presentation/widget/shimmer/event_bu_category_shimmer.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:gap/gap.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ExploreController(),
      builder: (ctrl) => AppScaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('   Explore', style: AppTextStyle.pagetitle),
        ),
        body: Obx(
          () => ctrl.isoading.value
              ? EventByCategoryShimmer()
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
                  child: Column(
                    children: [
                      HorizontalFlex(
                        // selectedCategory: ctrl.selectedCategory.value,
                        onPressed: (item) {
                          
                        },
                        categories: ctrl.categories.toList(),
                      ),
                      Gap(AppDimens.space15),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .65,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: ctrl.events.length,
                        itemBuilder: (context, index) {
                          var event = ctrl.events.elementAt(index);
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.eventDetail,
                                arguments: event.event_id.toInt(),
                              );
                            },
                            child: InfoCard(
                              eventid: event.event_id.toInt(),
                              location: event.address,
                              rating: event.average_rating,
                              eventName: event.event_name,
                              eventDate: event.event_date,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}