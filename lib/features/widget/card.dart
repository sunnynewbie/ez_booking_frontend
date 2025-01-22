import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final String eventName;
  final String organizerName;
  final String location;
  final num rating;
  final num totalReviews;
  final VoidCallback? onPressed;
  final int eventid;
  final DateTime? eventDate;
  final String imagePath;

  const InfoCard(
      {super.key,
      this.eventName = "Event Name Not Provided",
      this.location = "Event Location Not Provided",
      this.imagePath = AppAssets.travel,
      this.onPressed,
      this.organizerName = '',
      required this.eventid,
      required this.rating,
      this.totalReviews = 0,
      this.eventDate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius10),
            border: Border.all(
              color: Colors.black12,
            ),
            color: Colors.white),
        constraints: BoxConstraints(
          maxWidth: Get.width / 2.2,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Image.asset(
                    imagePath.toString(),
                    fit: BoxFit
                        .cover, // Ensure the image covers the container fully
                  ),
                ),
                if (rating.toInt() > 0)
                  Container(
                    height: 20,
                    margin: const EdgeInsets.all(AppDimens.space5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.space5,
                        vertical: AppDimens.space3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // Background color for the small container
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${rating.toInt()}',
                          // Text inside the small container
                          style: context.sm12.weigh500.withgrey78,
                        ),
                        Gap(AppDimens.space2),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: AppDimens.imageSize12,
                        ),
                        VerticalDivider(
                          width: 10,
                        ),
                        Text(
                          '${totalReviews}',
                          style: context.sm12.weigh500.withgrey78,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const Gap(AppDimens.space15),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.grey0f,
                borderRadius: BorderRadius.circular(3),
              ),
              margin: const EdgeInsets.symmetric(horizontal: AppDimens.space10),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.space5, vertical: AppDimens.space3),
              child: Text(
                  eventDate != null
                      ? DateFormat('EEE,dd MMM yy').format(eventDate!)
                      : '',
                  textAlign: TextAlign.center,
                  style: context.sm12),
            ),
            const Gap(AppDimens.space10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.space10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventName,
                      maxLines: 1,
                      // Limit the text to 2 lines
                      overflow: TextOverflow.ellipsis,
                      // Show ellipsis if the text exceeds 2 lines
                      style: context.md14.weigh500),
                  Gap(AppDimens.space5),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    location,
                    style: context.sm12.withgrey78,
                  ),
                  Gap(AppDimens.space5),
                  Text(
                    'By ${organizerName}',
                    style: context.sm12.withgrey78,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
