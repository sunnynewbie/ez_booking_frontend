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
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Event List",
                  style: AppTextStyle.header,
                ),
                Text(
                  "See All",
                  style: AppTextStyle.header1,
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllEventCard(
                  text: 'Music & Instruments',
                  text2: '15 + Classes',
                  imgPath: '',
                  color1: const Color.fromARGB(245, 48, 0, 87),
                  color2: const Color.fromARGB(183, 205, 167, 235),
                ),
                AllEventCard(
                  text: 'Music',
                  imgPath: '',
                  color1: const Color.fromARGB(255, 87, 150, 0),
                  color2: const Color.fromARGB(172, 184, 245, 167),
                  text2: '15 + Classes',
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.013,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllEventCard(
                  text: 'Music',
                  imgPath: '',
                  color1: const Color.fromARGB(255, 6, 160, 238),
                  color2: const Color.fromARGB(164, 149, 188, 243),
                  text2: '15 + Classes',
                ),
                AllEventCard(
                  text: 'Music',
                  imgPath: '',
                  color1: const Color.fromARGB(255, 58, 10, 181),
                  color2: const Color.fromARGB(255, 180, 186, 243),
                  text2: '15 + Classes',
                ),
              ],
            ),
          ],
        ));
  }
}
