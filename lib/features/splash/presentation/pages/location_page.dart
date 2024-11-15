import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Your Location',
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFont.lexend,
            fontSize: size.height * 0.02,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.03),
              height: size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.search),
                  SizedBox(
                    width: size.height * 0.01,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.primary,  // Corrected here
                      style: TextStyle(color: AppColors.primary),  // Corrected here
                      decoration: InputDecoration(
                        hintText: 'Search for location',
                        hintStyle: TextStyle(color: Colors.black45),  // Corrected here
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                border: Border.all(
                  color: Colors.black26,
                  width: 2
                )
              ),
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Container(
              padding: EdgeInsets.all(size.height * 0.02),
              alignment: Alignment.centerLeft,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose From Map',
              style: TextStyle(
                fontFamily: AppFont.lexend,
                fontSize: size.height * 0.018
              ),
              ),
              Image.asset(AppAssets.map)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
