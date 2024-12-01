import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Container(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          children: [
            Gap(AppDimens.space20),
            AppTextFormField(
              filled: true,
              hint: 'Search for location',
              fillColor: AppColors.grey0f,
              prefixIcon: Image.asset(
                AppAssets.search,
              ),
            ),
            const Gap(AppDimens.space15),
            AppTextFormField(
              fillColor: AppColors.grey0f,
              filled: true,
              hint: 'Choose from map',
              hintTextStyle: context.md14.withBlack,
              borderRadius: 0,
              borderColor: Colors.transparent,
              suffixIcon: Image.asset(AppAssets.map),
            ),
          ],
        ),
      ),
    );
  }
}
