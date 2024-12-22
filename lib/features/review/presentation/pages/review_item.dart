import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel item;

  const ReviewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius10),
        border: Border.all(color: AppColors.borderColor),
      ),
      margin: EdgeInsets.symmetric(horizontal: AppDimens.space15),
      padding: EdgeInsets.only(
          left: AppDimens.space16,
          right: AppDimens.space16,
          bottom: AppDimens.space10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageView(
              imageType: ImageType.network,
              path: 'path',
              height: AppDimens.imageSize45,
              width: AppDimens.imageSize45,
            ),
            title: Text(
              item.events?.event_name ?? '',
              style: context.md14.weigh500,
            ),
            subtitle: Text(
              item.events?.address ?? '',
              style: context.sm12.withgrey78,
            ),
          ),
          Divider(
            color: AppColors.borderColor,
            height: 0,
          ),
          Gap(AppDimens.space10),
          RatingBar(
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
            initialRating: item.rating.toDouble(),
            ignoreGestures: true,
            allowHalfRating: false,
            direction: Axis.horizontal,
            itemSize: AppDimens.imageSize30,
            updateOnDrag: false,
            tapOnlyMode: false,
          ),
          Gap(AppDimens.space5),
          Text(
            item.message,
            style: context.md14.withgrey78,
          ),
        ],
      ),
    );
  }
}
