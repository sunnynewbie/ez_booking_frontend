import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/home/presentation/widget/all_event_card.dart';
import 'package:ez_booking/features/home/presentation/widget/category_widget.dart';
import 'package:flutter/material.dart';

class AllEvent extends StatefulWidget {
  const AllEvent({super.key});

  @override
  State<AllEvent> createState() => _AllEventState();
}

class _AllEventState extends State<AllEvent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(size.width * 0.04),
        color: Colors.green,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllEventCard(
                    text: 'music & Instruments',
                    imgPath: '',
                    color1: const Color.fromARGB(245, 235, 255, 1),
                    color2: const Color.fromARGB(255, 201, 196, 159)),
                
                AllEventCard(
                    text: 'Music',
                    imgPath: '',
                    color1: Colors.red,
                    color2: Colors.yellow),
              ],
            ),
            SizedBox(
                  height: size.height * 0.02,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllEventCard(
                    text: 'Music',
                    imgPath: '',
                    color1: Colors.red,
                    color2: Colors.yellow),
                AllEventCard(
                    text: 'Music',
                    imgPath: '',
                    color1: Colors.red,
                    color2: Colors.yellow),
              ],
            ),
          ],
        ));
  }
}
