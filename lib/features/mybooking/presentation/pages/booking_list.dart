import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/features/mybooking/presentation/widget/write_review_dialog.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BookingList extends StatelessWidget {
  final List<MyBookingModel> bookings;

  const BookingList({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.space16,
        // vertical: AppDimens.space20,
      ),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        var bookingItems = bookings.elementAt(index);
        return Column(
          children: [
            SizedBox(
              height: AppDimens.space12,
            ),
            Column(
              children: bookingItems.booking_details
                  .map((item) =>
                   Container(
                    margin: EdgeInsets.only(bottom: AppDimens.space10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.space12,
                          vertical: AppDimens.space10,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppColors.greyd2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.borderRadius15),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  height: AppDimens.imageSize75,
                                  width: AppDimens.imageSize75,
                                  child: ImageView(
                                    imageType: ImageType.asset,
                                    path: AppAssets.music_review,
                                  ),
                                ),
                                const Gap(AppDimens.space12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 70,
                                      padding: EdgeInsets.only(right:5, left: 5, top: 3, bottom: 3),
                                      height: AppDimens.space19,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: item.booking_status == "pending" ? const Color.fromARGB(255, 235, 177, 3) : Colors.green
                                      ),
                                      child: Text(item.booking_status == "pending" ? "Inprogess" : "Completed",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10
                                      ),),
                                    ),
                                    Gap(
                                      AppDimens.space3
                                    ),
                                    Text(
                                      item.event_data.event_name,
                                      style: context.md14.weigh500,
                                    ),
                                    const Gap(AppDimens.space4),
                                    Text(
                                      item.event_data.address,
                                      style: context.sm12.withgrey78,
                                    ),
                                    const Gap(AppDimens.space4),
                                    Text(
                                      '₹${item.amount.toStringAsFixed(1)}',
                                      style: context.lg16.withBlack.weigh500,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: AppDimens.space12,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: AppDimens.space5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppElevatedButton(
                                      onTap: () {
                                        ReviewArgs args = ReviewArgs(
                                            eventBean: item.event_data,
                                            booking_id: item.booking_id,
                                            userid: item.booked_by_id,
                                            eventId:item.event_data.event_id);
                                        writeReview(args);
                                      },
                                      borderColor: AppColors.textGrey,
                                      buttonColor:
                                          AppColors.textGrey.withOpacity(0.2),
                                      borderRadius: AppDimens.borderRadius15,
                                      text: 'Leave Review',
                                      fontSize: 14,
                                      fontColor: AppColors.grey78,
                                    ),
                                  ),
                                  const Gap(AppDimens.space15),
                                  Expanded(
                                    child: AppElevatedButton(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.bookingDetails,
                                            arguments: item);
                                      },
                                      buttonColor: AppColors.primary,
                                      borderRadius: AppDimens.borderRadius15,
                                      text: 'View Details',
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => Padding(padding: EdgeInsets.only(top: 0, bottom: 0)),
    );
  }

  writeReview(ReviewArgs reviewArg) {
    Get.dialog(
      AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.space5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimens.borderRadius10,
          ),
        ),
        backgroundColor: Colors.white,
        content: Container(
          width: Get.width * .8,
          child: WriteReviewDialog(
            reviewArgs: reviewArg,
          ),
        ),
      ),
    );
  }
}
