import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetTheHostWidget extends StatelessWidget {
  const MeetTheHostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hosts = [
      {
        'id' : 1,
        'name': 'Sanjay Paswan',
        'imageUrl': 'https://cdn.pixabay.com/photo/2023/09/09/20/03/ai-generated-8243777_1280.jpg',
        'rating': 4.5,
      },
      
      {
        'id' : 2,
        'name': 'Leela Bhen',
        'imageUrl': 'https://www.the-sun.com/wp-content/uploads/sites/6/2023/02/AS_AI-WOMEN_OP.jpg?strip=all&quality=100&w=1920&h=1080&crop=1',
        'rating': 4.9,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderColor, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Meet the Host',
            style: AppTextStyle.header,
          ),
          const SizedBox(height: 15),
          ...hosts.map((host) {
            return GestureDetector(
              onTap: () => Get.toNamed('/host-profile', arguments: host['id']),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                 padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.borderColor
                        )
                      ),
                child: Padding(
              
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(host['imageUrl']!.toString()),
                      ),
                      const SizedBox(width: 15),
                       
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                host['name']!.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    host['rating']!.toString(),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
