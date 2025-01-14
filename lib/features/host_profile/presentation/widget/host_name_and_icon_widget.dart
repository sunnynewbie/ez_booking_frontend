import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:flutter/material.dart';

Widget NameAndIcons() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2023/09/09/20/03/ai-generated-8243777_1280.jpg',
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'James Ronald',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Event Reviewer',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset(AppAssets.youtube_icon
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppAssets.instagram_icon),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }