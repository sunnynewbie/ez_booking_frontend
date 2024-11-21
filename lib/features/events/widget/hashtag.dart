import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';

class HorizontalTextDisplay extends StatelessWidget {
  final List<String> items;
  final String eventName;

  const HorizontalTextDisplay(
      {super.key, required this.items, required this.eventName});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(left: size.width * 0.2, right: size.width * 0.2),
        padding: EdgeInsets.all(size.width * 0.02),
        margin: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
            top: size.width * 0.02),
        decoration: BoxDecoration(
            // color: Colors.red,
            // borderRadius: BorderRadius.circular(12),
            // border: Border.all(color: Colors.black12),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventName,
              style: AppTextStyle.pagetitle,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: items.map((item) {
                return Container(
                  margin: EdgeInsets.only(right: size.width * 0.02),

                  alignment: Alignment.center,
                  height: size.height * 0.025,
                  width: size.width * 0.15,
                  // padding: EdgeInsets.only(left: size.width * 0.2, right: size.width * 0.2),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(191, 227, 183, 234),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: Text('#' + item, style: AppTextStyle.regular),
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
