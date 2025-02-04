import 'package:carousel_slider/carousel_slider.dart';
import 'package:ez_booking/controller/event_service_with_id.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/extension/common_extension.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/events/pages/event_shimmer_widget.dart';
import 'package:ez_booking/features/events/presentation/widgets/request_callback_button.dart';
import 'package:ez_booking/features/events/services/location_service.dart';
import 'package:ez_booking/features/events/widget/event_details_field.dart';
import 'package:ez_booking/features/events/widget/meet_the_host_widget.dart';
import 'package:ez_booking/features/home/presentation/widget/image_viewer.dart';
import 'package:ez_booking/features/review/presentation/pages/review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
      init: EventDetailController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          title: const Text(
            'Event Details',
            style: AppTextStyle.pagetitle,
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.space15),
          child: Obx(
            () => _.isLoading.value
                ? const EventShimmerWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(AppDimens.space15),
                      Container(
                        color: Colors.white,
                        child: CarouselSlider.builder(
                          itemCount: 4,
                          itemBuilder: (context, index, realIndex) {
                            var item = 'assets/${[
                              'image1.png',
                              'image2.png',
                              'image3.png'
                            ][index % 3]}';
                            return InkWell(
                              onTap: () {
                                Get.dialog(
                                    ImageViewer(
                                      images: _.event.value!.images,
                                    ),
                                    barrierColor: Colors.black.withOpacity(.9));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageView(
                                    imageType: ImageType.asset, path: item),
                              ),
                            );
                          },
                          carouselController: _.carouselSliderController,
                          options: CarouselOptions(
                            aspectRatio: 12 / 9,
                            onPageChanged: (index, reason) {
                              _.currentImage.value = index;
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [1, 2, 3, 4]
                              .indexed
                              .map(
                                (e) => Obx(
                                  () => AnimatedContainer(
                                    duration: 500.ms,
                                    height: 10,
                                    width:
                                        _.currentImage.value == e.$1 ? 30 : 10,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: AppDimens.space2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primary,
                                      ),
                                      color: AppColors.darkBlue,
                                      borderRadius: BorderRadius.circular(
                                          _.currentImage.value == e.$1
                                              ? 1000
                                              : 10),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Gap(AppDimens.space15),
                      Text(
                        _.event.value?.event_name ?? '',
                        style: context.xl18.weigh600,
                      ),
                      Wrap(
                        spacing: AppDimens.space10,
                        children: _.event.value?.tags
                                .split(",")
                                .map(
                                  (e) => Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide.none,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppDimens.space15),
                                    side: BorderSide.none,
                                    backgroundColor: AppColors.purpleLight,
                                    label: Text('#$e',
                                        style: context.md14.withprimary),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                      const Gap(AppDimens.space10),
                      if (_.event.value!.average_rating > 0)
                        Row(
                          children: [
                            RatingBar(
                              ignoreGestures: true,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow,
                                ),
                                half: const Icon(
                                  Icons.star_half_rounded,
                                  color: Colors.yellow,
                                ),
                                empty: const Icon(
                                  Icons.star_border_rounded,
                                  color: Colors.yellow,
                                ),
                              ),
                              onRatingUpdate: (value) {},
                              itemCount: 5,
                              initialRating:
                                  _.event.value?.average_rating.toDouble() ?? 0,
                              allowHalfRating: false,
                              direction: Axis.horizontal,
                              itemSize: AppDimens.imageSize30,
                              updateOnDrag: false,
                              tapOnlyMode: false,
                            ),
                            Gap(AppDimens.space15),
                            Text(
                              "${_.event.value!.average_rating.toString()}.0",
                              style: const TextStyle(
                                  fontSize: AppDimens.space18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap(AppDimens.space5),
                            Text(
                                "(${_.event.value!.average_rating.toString()}+ ratings)",
                                style: const TextStyle(
                                    fontSize: AppDimens.space15,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      const Gap(AppDimens.space20),
                      MeetTheHostWidget(
                        organizer: _.event.value!.organizer,
                      ),
                      const Gap(AppDimens.space20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space15,
                            vertical: AppDimens.space15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(color: Colors.black12, width: 1.2),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text(
                            //   'Event Details',
                            //   style: AppTextStyle.header,
                            // ),
                            const Gap(AppDimens.space15),
                            EventDetailsField(
                                // title: 'Date',
                                iconPath: AppAssets.calender_new,
                                text: _.event.value?.event_date != null
                                    ? _.event.value!.event_date!.ddMMyyyy
                                    : ''),
                            const Gap(AppDimens.space15),
                            EventDetailsField(

                                // title: 'Address',
                                iconPath: AppAssets.location_new,
                                text: _.event.value?.address ?? '',
                                rightIconPath: AppAssets.direction_icon,
                                onRightButtonClick: () async {
                                  final locationService = LocationService();
                                  try {
                                    await locationService.openGoogleMaps(
                                      _.event.value?.latitude.toDouble() ?? 0.0,
                                      _.event.value?.longitude.toDouble() ??
                                          0.0,
                                    );
                                  } catch (e) {
                                    print('Error opening maps: $e');
                                  }
                                }),
                            const Gap(AppDimens.space15),
                            if (_.event.value != null &&
                                _.event.value!.event_days != null)
                              EventDetailsField(
                                  // title: 'Days',
                                  iconPath: AppAssets.duration_grey,
                                  text: _.event.value!.event_days!
                                      .map((e) => e.label)
                                      .join(','))
                            // Gap(AppDimens.space15),
                            // EventDetailsField(title: 'Duration', text: '3 Days'),
                          ],
                        ),
                      ),
                      const Gap(AppDimens.space15),
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.space15,
                            vertical: AppDimens.space15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(color: Colors.black12, width: 1.2),
                            color: Colors.white),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About event',
                              style: context.md14,
                            ),
                            const Gap(AppDimens.space10),
                            Text(
                              _.event.value?.event_desc ?? '',
                              style: context.md14.withgrey78,
                            ),
                          ],
                        ),
                      ),
                      const Gap(AppDimens.space15),
                      if (_.reviews.isEmpty)
                        const SizedBox.shrink()
                      else
                        Row(
                          children: [
                            Text(
                              'Reviews',
                              style: context.lg16.weigh500,
                            ),
                            const Gap(AppDimens.space10),
                            const Spacer(),
                            if (_.reviews.isNotEmpty)
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.eventReviews,
                                      arguments: _.event.value);
                                },
                                child: const Text('See all'),
                              ),
                          ],
                        ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = _.reviews.elementAt(index);
                            return ReviewItem(item: item);
                          },
                          separatorBuilder: (context, index) {
                            return const Gap(AppDimens.space15);
                          },
                          itemCount: _.reviews.length),
                      const Gap(AppDimens.space20),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: Obx(() =>
            // RequestCallbackButton(
            //   amount: _.event.value?.event_price.toMoney,
            // )
            RequestCallbackButton(
              isReuqest: _.event.value?.is_booking_requested ?? false,
              eventId: _.event.value?.event_id.toString(),
              amount: _.event.value?.event_price.toMoney,
            )),
      ),
    );
  }
}

class BookButton extends StatelessWidget {
  final VoidCallback onBookClick;
  final String? amount;

  const BookButton(
      {super.key, required this.onBookClick, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.space16,
          right: AppDimens.space16,
          bottom: AppDimens.space20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              amount ?? '',
              style: context.x20.weigh500,
            ),
          ),
          Expanded(
            flex: 4,
            child: AppElevatedButton(
              text: 'Book now',
              onTap: onBookClick,
            ),
          ),
        ],
      ),
    );
  }
}
