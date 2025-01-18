import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final String imgPath;
  final Function onPressed;

  const CategoryWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.imgPath,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    print('${NetworkUrl.imagePath}$imgPath');
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.grey0f),
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageView(
              imageType: ImageType.network,
              height: AppDimens.imageSize75,
              width: AppDimens.imageSize75,
              path: '${NetworkUrl.imagePath}$imgPath',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppDimens.space16,
                right: AppDimens.space16,
              ),
              child: Text(
                '$text',
                textAlign: TextAlign.center,
                style: context.lg16.weigh500,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
