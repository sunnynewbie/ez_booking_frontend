import 'dart:developer';

import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileWithAvatarTile extends StatelessWidget {
  const ProfileWithAvatarTile(
      {super.key, required this.username, required this.name});
  final String username;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.only(left:AppDimens.space20, right: AppDimens.space20),
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimens.space10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 100, //Static height needs to be change @TODO
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
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP4fNghY7Kx6eP79gmdp6YhesUm6GZGL53Rw&s',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.header,
                  ),
                  Text(
                    username.toString(),
                    style: AppTextStyle.header1,
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              child: IconButton(
                onPressed: (){
                  Get.toNamed('/editUserProfile');
                },
                icon: Image.asset(AppAssets.editIcon, scale: 4,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NormalTitle extends StatefulWidget {
  final String imgPath;
  final String text;
  final VoidCallback ontap;
  const NormalTitle({super.key, required this.imgPath, required this.text, required this.ontap});

  @override
  State<NormalTitle> createState() => _NormalTitleState();
}

class _NormalTitleState extends State<NormalTitle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.space20,
          right: AppDimens.space20,
          top: AppDimens.space5,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          height: 80, // TODO: Adjust dynamically if required later
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 244, 243, 243),
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                // decoration: BoxDecoration(
                //   color: AppColors.textGrey,
                //   borderRadius: BorderRadius.circular(AppDimens.borderRadius10),
                // ),
                child: Image.asset(widget.imgPath, scale: 3.4,),
              ),
              SizedBox(width: AppDimens.space12),
      
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: AppTextStyle.header1,
                    ),
                     IconButton(icon: Image.asset(AppAssets.arrowIcon, scale: 3.5,), onPressed: (){},),
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
