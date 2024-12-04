import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingEventItem extends StatelessWidget {
  final String eventTitle;
  final String eventAddress;
  final String eventImage;
  final DateTime? evetnDate;

  const BookingEventItem(
      {super.key,
      required this.eventTitle,
      required this.eventAddress,
      required this.evetnDate,
      required this.eventImage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius10),
          side: BorderSide(
            color: AppColors.greyd2,
          )),
      leading: ImageView(
        imageType: ImageType.network,
        path: eventImage,
        height: AppDimens.imageSize50,
        width: AppDimens.imageSize50,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateStr),
          Text(
            eventTitle,
            style: context.lg16.weigh500.withBlack,
          ),
          Text(
            eventAddress,
            style: context.md13.weigh400.withgrey78,
          ),
        ],
      ),
    );
  }

  String get dateStr => DateFormat('dd MMM,yyyy').format(evetnDate!);
}
