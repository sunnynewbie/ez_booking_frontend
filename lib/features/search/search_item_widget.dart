import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/model/search_result_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchItemWidget extends StatelessWidget {
 final SearchItem item;
  const SearchItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.space12,
        vertical: AppDimens.space8,
      ),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(AppDimens.borderRadius10),
          border: Border.all(color: AppColors.borderColor)),
      child: Row(
        children: [
          ImageView(
            imageType: ImageType.network,
            path: '${NetworkUrl.imagePath}${item.image_path}',
            height: AppDimens.space60,
            width: AppDimens.space60,
          ),
          const Gap(AppDimens.space10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.name} ${item.event_type.isNotEmpty?"(${item.event_type})":''}",
                  style: context.md14.withBlack,
                ),
                if(item.address.isNotEmpty)
                Text(
                  item.address,
                  style: context.sm12.withgrey78,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
