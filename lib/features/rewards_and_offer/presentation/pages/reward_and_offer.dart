import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/widget/not_found_component.dart';
import 'package:flutter/material.dart';

class RewardAndOffer extends StatelessWidget {
  const RewardAndOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward and offers'),
        backgroundColor: Colors.white,
      ),
      body: NotFound(imgPath: AppAssets.hotAirBallon, text: 'No Offers and Rewards')
    );
  }
}