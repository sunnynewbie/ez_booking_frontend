import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileWithAvatarTile extends StatelessWidget {
  const ProfileWithAvatarTile(
      {super.key,
      required this.username,
      required this.name,
      required this.phoneNumber});

  final String phoneNumber;
  final String username;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.space20, right: AppDimens.space20),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimens.space10),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 100,
        //Static height needs to be change @TODO
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 244, 243, 243)),
            borderRadius: BorderRadius.circular(AppDimens.borderRadius10)),
        child: Row(
          children: [
            Container(
              child: Container(
                height: AppDimens.imageSize80,
                width: AppDimens.imageSize80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: ImageView(
                    imageType: ImageType.network,
                    boxFit: BoxFit.cover,
                    path:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP4fNghY7Kx6eP79gmdp6YhesUm6GZGL53Rw&s',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name.isEmpty ? 'Ezbook user' : name,
                    style: context.lg16.weigh500,
                  ),
                  Text(
                    phoneNumber.toString(),
                    style: context.md14.withgrey78,
                  ),
                  Text(
                    phoneNumber.toString(),
                    style: context.md14.withgrey78,
                  )
                ],
              ),
            ),
            const Spacer(),
            if (Appservice.instance.user.value!.user_type == UserType.user)
              Container(
                padding: const EdgeInsets.all(5),
                child: IconButton(
                  onPressed: () {
                    if (Appservice.instance.user.value!.user_type ==
                        UserType.user) {
                      Get.toNamed(AppRoutes.editUserProfile);
                    }
                  },
                  icon: Image.asset(
                    AppAssets.editIcon,
                    scale: 4,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class NormalTitle extends StatelessWidget {
  final String imgPath;
  final String text;
  final VoidCallback ontap;

  const NormalTitle(
      {super.key,
      required this.imgPath,
      required this.text,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppDimens.space16,
          right: AppDimens.space16,
          top: AppDimens.space5,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: AppColors.grey0f,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: [
              ImageView(
                imageType: ImageType.asset,
                path: imgPath,
                height: AppDimens.imageSize35,
                width: AppDimens.imageSize35,
              ),
              const Gap(AppDimens.space12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: context.lg16.withBlack),
                    IconButton(
                      icon: const ImageView(
                        path: AppAssets.arrowIcon,
                        imageType: ImageType.asset,
                        height: AppDimens.imageSize24,
                        width: AppDimens.imageSize24,
                      ),
                      onPressed: () {},
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
