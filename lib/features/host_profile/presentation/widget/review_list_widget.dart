import 'package:flutter/material.dart';

Widget Review() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Abhishek Review's",
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
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                              'https://static.vecteezy.com/system/resources/previews/031/721/689/large_2x/ai-generated-studio-portrait-of-handsome-indian-man-on-colour-background-photo.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mavin Will',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Business Manager',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.format_quote, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
