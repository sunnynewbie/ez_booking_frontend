import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:ez_booking/features/mybooking/presentation/widget/review_dialog_controller.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
class ReviewArgs{
  EventBean eventBean;
  num booking_id;
  num userid;
  num eventId;

  ReviewArgs({
    required this.eventBean,
    required this.booking_id,
    required this.userid,
    required this.eventId,
  });
}


class WriteReviewDialog extends StatelessWidget {
  final ReviewArgs reviewArgs;

  const WriteReviewDialog({super.key, required this.reviewArgs});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReviewDialogController(booking_detailsBean: reviewArgs),
      builder: (_) => Form(
        key: _.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ImageView(
                  imageType: ImageType.network,
                  path: '',
                  width: AppDimens.imageSize45,
                  height: AppDimens.imageSize45,
                ),
                Gap(AppDimens.space10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviewArgs.eventBean.event_name,
                        style: context.md14.weigh500.withprimary,
                      ),
                      Gap(AppDimens.space4),
                      Text(
                        reviewArgs.eventBean.address,
                        style: context.sm12.withgrey78,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(AppDimens.space15),
            Center(
              child: Obx(
                () => FormField<double>(
                  initialValue: _.rating.value,
                  validator: (value) {
                    if (value == 0) {
                      return 'Please select rating';
                    }
                    return null;
                  },
                  builder: (field) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingBar(
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          half: Icon(
                            Icons.star_half_rounded,
                            color: Colors.yellow,
                          ),
                          empty: Icon(
                            Icons.star_outline_rounded,
                            color: Colors.yellow,
                          ),
                        ),
                        onRatingUpdate: (value) {
                          _.rating.value = value;
                          field.didChange(value);
                        },
                        itemCount: 5,
                        initialRating: _.rating.value,
                        itemSize: AppDimens.imageSize45,
                      ),
                      Gap(AppDimens.space2),
                      if (field.hasError)
                        Text(
                          field.errorText ?? '',
                          style: context.sm12.withErrorRed,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(AppDimens.space15),
            AppTextFormField(
              label: 'Write your thought',
              minLines: 4,
              maxLines: 6,
              controller: _.remarkCtrl,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please write some review';
                }
              },
            ),
            Gap(AppDimens.space15),
            Obx(
              () => _.loading.value
                  ? SizedBox(
                      height: AppDimens.buttonHeight,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: AppElevatedButton(
                            onTap: () {
                              Get.back();
                            },
                            text: 'Cancel',
                            fontColor: AppColors.primary,
                            buttonColor: Colors.white,
                          ),
                        ),
                        Gap(AppDimens.space15),
                        Expanded(
                          child: AppElevatedButton(
                            onTap: () {
                              if (_.formKey.currentState!.validate()) {
                                _.writeReview();
                              }
                            },
                            text: 'Save',
                          ),
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
