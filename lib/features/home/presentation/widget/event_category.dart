import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/home/presentation/widget/category_widget.dart';
import 'package:ez_booking/model/dashboard_cateogry_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventCategory extends StatelessWidget {
  final List<Category_typeBean> categories;

  const EventCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Events Categories',
          style: context.lg16.weigh500,
        ),
        Gap(AppDimens.space15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories
              .map((e) => CategoryWidget(
                    height: size.height * 0.19,
                    width: size.width * 0.44,
                    text: e.category_type,
                    imgPath: e.image_path,
                    onPressed: () =>
                        Get.toNamed(RouteConfig.eventByCateogry, arguments: e),
                  ))
              .toList(),
        )
      ],
    );
  }
}
