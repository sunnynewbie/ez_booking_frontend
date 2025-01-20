import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/model/organizer_model.dart';
import 'package:flutter/material.dart';

class NameTile extends StatelessWidget {
  final OrganizerModel organizerModel;

  const NameTile({super.key, required this.organizerModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(
                organizerModel.image_path,
                errorListener: (p0) {},
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
            StatItem(value: '0', label: 'Reviews'),
            StatItem(value: '0', label: 'Ratings'),
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
