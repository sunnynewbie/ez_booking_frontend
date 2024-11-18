import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';

class PopularEvent extends StatefulWidget {
  const PopularEvent({super.key});

  @override
  State<PopularEvent> createState() => _PopularEventState();
}

class _PopularEventState extends State<PopularEvent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(size.width * 0.04),
      child: Column(
        children: [
          Container(
            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("Popular Events", style: AppTextStyle.header, ),
                Text("See All", style: AppTextStyle.header1,)
              ],
            ),
          ),
          SizedBox(height: size.height * 0.012 ,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(),
                InfoCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}