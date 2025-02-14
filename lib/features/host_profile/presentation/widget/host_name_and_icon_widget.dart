import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/model/organizer_model.dart';
import 'package:flutter/material.dart';

class NameTile extends StatelessWidget {
  final OrganizerModel organizerModel;
  final num rating;
  final num reviews;

  const NameTile(
      {super.key,
      required this.organizerModel,
      required this.rating,
      required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // CircleAvatar(
            //   radius: 25,
            //   backgroundImage: CachedNetworkImageProvider(
            //     organizerModel.image_path,
            //     errorListener: (p0) {},
            //   ),
            // ),
            const CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: ImageView(
                  boxFit: BoxFit.fill,
                  imageType: ImageType.network,
                  path:
                      'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${organizerModel.f_name} ${organizerModel.l_name}',
                            style: context.x20.withWhite.weigh500,
                          ),
                          Text(organizerModel.categories,
                              style: context.md14.withgrey78),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatItem(value: '$reviews', label: 'Reviews'),
            StatItem(value: '$rating', label: 'Ratings'),
            StatItem(
                value: '${organizerModel.experience}', label: 'yr of\nhosting'),
          ],
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;

  const StatItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.xl18.weigh500.withWhite,
        ),
        Text(
          label,
          style: context.md14.withgrey78,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
