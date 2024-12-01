import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/widget/not_found_component.dart';
import 'package:flutter/material.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reviews'),
        backgroundColor: Colors.white,
      ),
      body: NotFound(imgPath: AppAssets.group, text: 'No Reviews '),
    );
  }
}