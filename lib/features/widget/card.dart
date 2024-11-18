import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        children: [
          // Wrap the image in a ClipRRect to apply borderRadius
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight:
                    Radius.circular(5)), // Apply the same borderRadius here
            child: Container(
              height: size.height * 0.18,
              child: Stack(
            children: [
              // The Image widget is at the bottom layer of the stack
              ClipRRect(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight:
                    Radius.circular(5)), 
                child: Container(
                  height: size.height * 0.18,
                  // width: double.infinity, // Make the image span the full width
                  child: Image.asset(
                    AppAssets.travel,
                    fit: BoxFit.cover, // Ensure the image covers the container fully
                  ),
                ),
              ),
              
              // Positioned widget to place the small container on the top-right corner of the image
              Positioned(
                top: size.height * 0.01,
                right: size.width * 0.03,
                child: Container(
                  width: size.height * 0.05, // Width of the small container
                  height: size.height * 0.028, // Height of the small container
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the small container
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  child: Center(
                    child: Text(
                      '99+', // Text inside the small container
                      style: AppTextStyle.regular
                    ),
                  ),
                ),
              ),
            ],
          ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: size.width * 0.02,
              left: size.width * 0.02,
              right: size.width * 0.02,
            ),
            // height: size.height * 0.06,
            // color: Colors.yellow,
            child: Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.008, right: size.width * 0.008),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.003, right: size.width * 0.003),
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width * 0.005,
                              right: size.width * 0.005),

                          // padding: EdgeInsets.only(left: size.width * 0.005,right: size.width * 0.005 ),
                          child: Text('Thu, Sep 21 - Fri, Sep 22',
                              style: AppTextStyle.regular),
                        )
                      ],
                    ),
                  ),
                  // ConstrainedBox to limit the size of the text container
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: size.width *
                          0.6, // Set max width for the text container
                    ),
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 8.0),
                      padding: EdgeInsets.only(
                          top: size.height * 0.003,
                          bottom: size.height * 0.005),
                      child: Text(
                          'Group Trekking/Camping: A fun and adventurous experience for all ages.',
                          maxLines: 2, // Limit the text to 2 lines
                          overflow: TextOverflow
                              .ellipsis, // Show ellipsis if the text exceeds 2 lines
                          style: AppTextStyle.subheading),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.005, right: size.width * 0.005),

                    // padding: EdgeInsets.only(left: size.width * 0.005,right: size.width * 0.005 ),
                    child: Text('Manali uttrakhand(india)',
                        style: AppTextStyle.regular2),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
