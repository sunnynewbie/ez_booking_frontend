import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ImageType { asset, network, file }

class ImageView extends StatelessWidget {
  final ImageType imageType;
  final String path;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const ImageView(
      {super.key,
      required this.imageType,
      required this.path,
      this.height,
      this.width,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return switch (imageType) {
      ImageType.asset => Image.asset(
          path,
          fit: boxFit,
          height: height,
          width: width,
        ),
      ImageType.network => CachedNetworkImage(
          imageUrl: path,
          fit: boxFit,
          height: height,
          width: width,
          errorListener: (value) {},
          errorWidget: (context, url, error) => Image.asset(
            AppAssets.appIcon,
            fit: boxFit,
            height: height,
            width: width,
          ),
        ),
      ImageType.file => Image.file(
          File(path),
          width: width,
          height: height,
          fit: boxFit,
        ),
    };
  }
}
