import 'package:ez_booking/controller/booking_detail_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/extension/common_extension.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/events/widget/booking_event_item.dart';
import 'package:ez_booking/features/events/widget/event_summery_widget.dart';
import 'package:ez_booking/features/mybooking/presentation/widget/write_review_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BookingDetailspage extends StatelessWidget {
  const BookingDetailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailController>(
      init: BookingDetailController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          title: Text(
            'Booking Details',
            style: TextStyle(
                color: Colors.black,
                fontFamily: AppFont.lexend,
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => Padding(
                  padding: EdgeInsets.all(AppDimens.space15),
                  child: _.bookingDetail.value == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(AppDimens.space15),
                            ListTile().shimmerEffect(
                                height: 90, width: double.maxFinite),
                            Gap(AppDimens.space30),
                            SizedBox().shimmerEffect(),
                            Gap(AppDimens.space10),
                            SizedBox().shimmerEffect(
                                height: 180, width: double.maxFinite),
                            Gap(AppDimens.space30),
                            SizedBox().shimmerEffect(),
                            Gap(AppDimens.space10),
                            SizedBox().shimmerEffect(
                                height: 180, width: double.maxFinite),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_.bookingDetail.value != null)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Obx(
                                      ()=> Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppDimens.space8,
                                        vertical: AppDimens.space4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: _.bookingDetail.value?.status ==
                                                "pending"
                                            ? const Color.fromARGB(
                                                255, 235, 177, 3)
                                            : _.bookingDetail.value?.status ==
                                                    "completed"
                                                ? Colors.green
                                                : AppColors.errorRed),
                                    child: Text(
                                      _.bookingDetail.value?.status ?? '',
                                      style: context.md13.weigh500.withWhite,
                                    ),
                                  ),
                                ),
                              ),
                            Gap(AppDimens.space10),
                            Obx(
                              () => _.bookingDetail.value == null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.eventDetail,
                                            arguments: _.bookingDetail.value!
                                                .event.event_id);
                                      },
                                      child: BookingEventItem(
                                        eventTitle: _.bookingDetail.value!.event
                                            .event_name,
                                        eventImage: '',
                                        eventAddress: _
                                            .bookingDetail.value!.event.address,
                                        evetnDate:
                                            _.bookingDetail.value!.created_at,
                                      ),
                                    ),
                            ),
                            SizedBox(height: 15),
                            Obx(
                              () => _.bookingDetail.value == null
                                  ? SizedBox()
                                  : EventSummeryWidget(
                                      title: "Booking details",
                                      content: [
                                        RowContent(
                                            title: 'booking date',
                                            content: _.bookingDetail.value!
                                                .created_at.ddMMyyyyHHmma,
                                            titleStyle: context.md14.withgrey78,
                                            contentStyle:
                                                context.md14.weigh500),
                                        RowContent(
                                            title: 'Location',
                                            content: _.bookingDetail.value!
                                                .event.address,
                                            titleStyle: context.md14.withgrey78,
                                            contentStyle:
                                                context.md14.weigh500),
                                        // RowContent(
                                        //     title: "Time",
                                        //     content: '',
                                        //     titleStyle: context.md14.withgrey78,
                                        //     contentStyle: context.md14.weigh500)
                                      ],
                                    ),
                            ),
                            /* SizedBox(height: 15),
                            EventSummeryWidget(
                              title: 'Price details',
                              content: [
                                RowContent(
                                    title: 'Grand total',
                                    content:
                                        _.bookingDetail.value?.amount.toMoney ??
                                            '',
                                    titleStyle: context.md14.withgrey78,
                                    contentStyle: context.md14.withgrey78),
                                // RowContent(
                                //     title: 'Tax',
                                //     content: '',
                                //     titleStyle: context.md14.withgrey78,
                                //     contentStyle: context.md14.withgrey78),
                                // RowContent(
                                //     title: 'Grand Total',
                                //     content: _.bookingDetail,
                                //     titleStyle: context.lg16.weigh500,
                                //     contentStyle: context.lg16.weigh500)
                              ],
                            ),
                           */
                            Gap(AppDimens.space30),
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppDimens.space15),
              child: Obx(
                () => Visibility(
                  visible: !_.isLoading.value,
                  child: Column(
                    children: [
                      AppElevatedButton(
                        text: 'Write a review',
                        onTap: () {
                          ReviewArgs args = ReviewArgs(
                              eventBean: _.bookingDetail.value!.event,
                              booking_id: _.bookingDetail.value!.id.toInt(),
                              userid: _.bookingDetail.value!.user.id.toInt(),
                              eventId: _.bookingDetail.value!.event.event_id
                                  .toInt());
                          Get.dialog(
                            AlertDialog(
                              insetPadding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.space5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.borderRadius10,
                                ),
                              ),
                              backgroundColor: Colors.white,
                              content: Container(
                                width: Get.width * .8,
                                child: WriteReviewDialog(reviewArgs: args),
                              ),
                            ),
                          );
                        },
                        width: double.maxFinite,
                        buttonColor: Colors.white,
                        fontColor: AppColors.primary,
                      ),
                      const Gap(AppDimens.space15),
                      Visibility(
                        visible: _.bookingDetail.value!.status!='cancel',
                        child: AppElevatedButton(
                          onTap: () async {
                            var response =
                                await Get.dialog(_buildCancelDialogue(context));
                            if (response is bool && response) {
                              _.cancelBooking();
                            }
                          },
                          borderRadius: 15,
                          height: AppDimens.space40,
                          width: double.infinity,
                          text: 'Cancel Booking',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelDialogue(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius10)),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              height: 40,
              width: 40,
              child: Image.asset(
                AppAssets.bookingIcon,
                scale: 4,
              ),
            ),
            Text(
              'Do you want to cancel booking request?',
              textAlign: TextAlign.left,
              style: context.lg16.weigh500,
            ),
            SizedBox(height: 20),
            AppElevatedButton(
              onTap: () {
                Get.back(result: true);
              },
              width: double.infinity,
              height: 42,
              borderRadius: 15,
              text: 'Yes',
            ),
            SizedBox(height: 15),
            AppElevatedButton(
              onTap: () {
                Get.back();
              },
              width: double.infinity,
              height: 42,
              borderRadius: 15,
              text: 'No',
              borderColor: Colors.grey.withOpacity(0.4),
              buttonColor: Colors.white,
              fontColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
