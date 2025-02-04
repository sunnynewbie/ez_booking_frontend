import 'package:ez_booking/controller/select_city_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SelectedCityPage extends StatelessWidget {
  const SelectedCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<SelectCityController>(
      init: SelectCityController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Your Location',
            style: TextStyle(
              color: Colors.black,
              fontFamily: AppFont.lexend,
              fontSize: size.height * 0.02,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(AppDimens.space20),
              /*AppTextFormField(
                filled: true,
                hint: 'Search for location',
                controller: _.cityCtrl,
                fillColor: AppColors.grey0f,
                prefixIcon: Image.asset(
                  AppAssets.search,
                ),
                onChange: (value) {},
              ),
              const Gap(AppDimens.space15),
              */
              Obx(
                () => Text(
                    'Current Location :${_.selectedCity.value?.city_name ?? ' -'}'),
              ),
              const Gap(AppDimens.space10),
              Obx(
                () => Expanded(
                  child: _.isLoading.value && _.cities.isEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) =>
                              const SizedBox().shimmerEffect(
                            width: double.maxFinite,
                            height: 90,
                          ),
                          itemCount: 5,
                          separatorBuilder: (context, index) =>
                              const Gap(AppDimens.space15),
                        )
                      : ListView(
                          shrinkWrap: true,
                          children: [
                            Text(
                              'popular cities',
                              style: context.lg16.weigh500,
                            ),
                            const Gap(AppDimens.space10),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: AppDimens.space15,
                                      mainAxisSpacing: AppDimens.space15),
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _.popularCities.length,
                              itemBuilder: (context, index) {
                                var item = _.popularCities.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    _.selectedCity.value = item;
                                  },
                                  child: Obx(
                                    () => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.borderRadius10),
                                        color: _.selectedCity.value == item
                                            ? AppColors.grey0f
                                            : Colors.white,
                                        border: Border.all(
                                          color: _.selectedCity.value == item
                                              ? AppColors.grey78
                                              : AppColors.greyd2,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          const Gap(AppDimens.space10),
                                          Expanded(
                                            child: ImageView(
                                              imageType: ImageType.network,
                                              path: item.image_path,
                                              height: AppDimens.imageSize55,
                                              width: AppDimens.imageSize55,
                                            ),
                                          ),
                                          const Gap(AppDimens.space5),
                                          Text(
                                            item.city_name,
                                            style: context.md14,
                                            maxLines: 2,
                                          ),
                                          const Gap(AppDimens.space10),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Gap(AppDimens.space15),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var item = _.normalCities.elementAt(index);
                                return Obx(
                                  () => Material(
                                    child: ListTile(
                                      tileColor: _.selectedCity.value == item
                                          ? AppColors.grey0f
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.borderRadius10),
                                          side: BorderSide(
                                            color: _.selectedCity.value == item
                                                ? AppColors.grey78
                                                : AppColors.greyd2,
                                          )),
                                      title: Text(
                                        item.city_name,
                                        style: context.md14.weigh500.withgrey78,
                                      ),
                                      onTap: () {
                                        _.selectedCity.value = item;
                                      },
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Gap(AppDimens.space15),
                              itemCount: _.normalCities.length,
                            ),
                            const Gap(AppDimens.space20),
                          ],
                        ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !_.isLoading.value,
                  child: AppElevatedButton(
                    onTap: () {
                      _.selectCity();
                    },
                    isLoading: _.isLoading.value,
                    text: 'Select current city',
                    width: double.maxFinite,
                  ),
                ),
              ),
              const Gap(AppDimens.space15),
            ],
          ),
        ),
      ),
    );
  }
}
