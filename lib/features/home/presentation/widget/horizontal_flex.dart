import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HorizontalFlex extends StatelessWidget {
  final Function(AllCategoryBean item)? onPressed;
  final List<AllCategoryBean> categories;
  final AllCategoryBean? selectedCategory;

  const HorizontalFlex(
      {super.key,
      required this.onPressed,
      required this.categories,
      this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = categories.elementAt(index);
            bool selected = item == selectedCategory;
            return InkWell(
              onTap: () {
                onPressed?.call(item);
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 90,
                  minWidth: 90,
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppDimens.imageSize70,
                      width: AppDimens.imageSize70,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimens.borderRadius10),
                        color: AppColors.grey78.withOpacity(selected ? .4 : .1),
                      ),
                      child: Center(
                        child: ImageView(
                          imageType: ImageType.network,
                          path: item.category_name,
                          height: AppDimens.imageSize50,
                          width: AppDimens.imageSize50,
                        ),
                      ),
                    ),
                    Gap(AppDimens.space10),
                    Expanded(
                      child: Text(
                        item.category_name,
                        style: context.md14.weigh500.copyWith(
                            color:
                                selected ? Colors.black87 : AppColors.grey78),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(AppDimens.space10);
          },
          itemCount: categories.length),
    );
  }
}
