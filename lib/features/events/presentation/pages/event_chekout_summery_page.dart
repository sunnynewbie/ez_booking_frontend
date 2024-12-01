import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventChekoutSummeryPage extends StatelessWidget {
  const EventChekoutSummeryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event summery',
          style: context.lg16.weigh500,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.space15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppDimens.space15),
            Row(
              children: [
                ImageView(
                  imageType: ImageType.network,
                  path: '',
                  height: AppDimens.space60,
                  width: AppDimens.space60,
                ),
                Gap(AppDimens.space5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
