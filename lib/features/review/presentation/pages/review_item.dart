import 'package:ez_booking/core/api/network_url.dart';
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
      padding: const EdgeInsets.only(
          left: AppDimens.space16,
          right: AppDimens.space16,
          bottom: AppDimens.space10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.events != null) ...[
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppDimens.space5,
              ),
              leading: const ImageView(
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
            const Divider(
              color: AppColors.borderColor,
              height: 0,
            ),
          ],
          if (item.user != null) ...[
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppDimens.space5,
              ),
              leading:  const ClipOval(
                child: ImageView(
                  boxFit: BoxFit.cover,
                  imageType: ImageType.network,
                  // path:  '${NetworkUrl.imagePath}${item.user?.img}' ?? '', 
                  path: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                  height: AppDimens.imageSize45,
                  width: AppDimens.imageSize45,
                ),
              ),
              title: Text(
                item.user?.displayName ?? '',
                style: context.md14.weigh500,
              ),
            ),
            const Divider(
              color: AppColors.borderColor,
              height: 0,
            ),
          ],
          const Gap(AppDimens.space10),
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
          const Gap(AppDimens.space5),
          Text(
            item.message,
            style: context.md14.withgrey78,
          ),
        ],
      ),
    );
  }
}
