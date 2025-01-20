import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:flutter/material.dart';


class OrganizerReviewList extends StatelessWidget {
  final List<ReviewModel> reviews;

  const OrganizerReviewList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Reviews",
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
            itemCount: reviews.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              var item = reviews.elementAt(index);
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
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(
                            item.user?.displayName ?? '',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item.user?.displayName ?? '',
                          style: context.md14.weigh500,
                        ),
                        const Spacer(),
                        const Icon(Icons.format_quote, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.message,
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
}
