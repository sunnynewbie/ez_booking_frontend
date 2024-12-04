import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/features/events/pages/event_detail_page.dart';

class EventSummeryWidget extends StatelessWidget {
  final String title;
  final List<RowContent> content;
  const EventSummeryWidget(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(AppDimens.space15),
        Text(
          title,
          style: context.xl18.weigh500,
        ),
        Gap(AppDimens.space15),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.space20,
            vertical: AppDimens.space20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.greyd2,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              AppDimens.borderRadius10,
            ),
          ),
          child: Table(
            children: content
                .map(
                  (e) => TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.space5),
                        child: Text(
                          e.title,
                          style: e.titleStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.space5),
                        child: Text(
                          e.content,
                          style: e.contentStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ]),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class RowContent {
  String title;
  String content;
  TextStyle titleStyle;
  TextStyle contentStyle;
  RowContent({
    required this.title,
    required this.content,
    required this.titleStyle,
    required this.contentStyle,
  });
}
