import 'package:ez_booking/features/widget/card.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

Widget EventListing(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Abhishek's Lisiting",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return InfoCard(
                eventid: 1, 
                rating: 99,
                eventName: "Event",
                location: "Mumbai",
                onPressed: (){},
                ) ;
            },
          ),
        )
      ],
    );
  }
