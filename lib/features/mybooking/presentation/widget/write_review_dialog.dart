import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
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
      final imagePicker = ImagePicker();

    return  GetBuilder(
      init: ReviewDialogController(booking_detailsBean: reviewArgs),
      builder: (_) => Container(
        padding: const EdgeInsets.all(AppDimens.space16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Form(
          key: _.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Event Info and Rating sections remain the same
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageView(
                      imageType: ImageType.network,
                      path: '',
                      width: AppDimens.imageSize45,
                      height: AppDimens.imageSize45,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Gap(AppDimens.space10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewArgs.eventBean.event_name,
                          style: context.md14.weigh500,
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
              Gap(AppDimens.space20),
              
              // Rating Stars
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
                            full: Icon(Icons.star_rounded, color: Colors.blue),
                            half: Icon(Icons.star_half_rounded, color: Colors.blue),
                            empty: Icon(Icons.star_border_rounded, color: Colors.blue),
                          ),
                          onRatingUpdate: (value) {
                            _.rating.value = value;
                            field.didChange(value);
                          },
                          itemCount: 5,
                          initialRating: _.rating.value,
                          itemSize: AppDimens.imageSize30,
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
              Gap(AppDimens.space20),
              
              // Review Text Field
              Text('Write your thought', style: context.md14),
              Gap(AppDimens.space10),
              AppTextFormField(
                hint: 'Write your thought',
                minLines: 3,
                maxLines: 4,
                controller: _.remarkCtrl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please write some review';
                  }
                  return null;
                },
              ),
              Gap(AppDimens.space20),
              
               Obx(() {
                  if (_.selectedImages.isEmpty) {
                    return InkWell(
                      onTap: () => _.pickImages(),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(AppDimens.space20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.cloud_upload_outlined, 
                                 color: Colors.grey[600], 
                                 size: 32),
                            Gap(AppDimens.space8),
                            Text(
                              'Click to upload image',
                              style: context.sm12.withgrey78,
                            ),
                            Text(
                              'PNG, JPG',
                              style: context.sm12.withgrey78,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _.selectedImages.length,
                            separatorBuilder: (context, index) => Gap(AppDimens.space10),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(_.selectedImages[index].path),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 4,
                                    child: InkWell(
                                      onTap: () {
                                        _.selectedImages.removeAt(index);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Gap(AppDimens.space10),
                        InkWell(
                          onTap: () => _.pickImages(),
                          child: Text(
                            'Add more images',
                            style: context.md14.copyWith(color: AppColors.primary),
                          ),
                        ),
                      ],
                    );
                  }
                }),
              Gap(AppDimens.space20),
              
              Obx(
                () => _.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                        children: [
                          Expanded(
                            child: AppElevatedButton(
                              onTap: () => Get.back(),
                              text: 'Cancel',
                              buttonColor: Colors.white,
                              fontColor: AppColors.primary,
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
                              buttonColor: AppColors.darkBlue,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
