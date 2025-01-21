import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/not_found_component.dart';
import 'package:ez_booking/features/widget/card.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OrganizationEvents extends StatelessWidget {
  final EventModel eventModel;

  const OrganizationEvents({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Event",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Gap(AppDimens.space15),
        /*Container(
          height: MediaQuery.of(context).size.height * 0.32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return
            },
          ),
        )*/
        InfoCard(
          eventid: eventModel.event_id.toInt(),
          rating: eventModel.average_rating,
          eventName: eventModel.event_name,
          location: eventModel.city.city_name,
          eventDate: eventModel.event_date,
          imagePath: eventModel.image_path,
          totalReviews: eventModel.total_reviews,
          organizerName:
              "${eventModel.organizer?.f_name} ${eventModel.organizer?.l_name}",
          onPressed: () {
            Get.toNamed(AppRoutes.eventDetail, arguments: eventModel.event_id);
          },
        ),
      ],
    );
  }
}

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
        (reviews.isEmpty)
            ? const NotFound(imgPath: AppAssets.group, text: 'No Reviews')
            : SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: reviews.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
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
                              const Icon(Icons.format_quote,
                                  color: Colors.grey),
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
