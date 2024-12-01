import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/widget/app_textform_field.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.space16),
        child: Column(
          children: [
            AppTextFormField(
              prefixIcon: Image.asset(
                AppAssets.search_normal,
                color: AppColors.black32,
              ),
              hint: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
