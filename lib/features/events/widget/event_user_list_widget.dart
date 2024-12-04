import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_param.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventUserListWidget extends StatelessWidget {
  final List<EventUser> users;
  const EventUserListWidget({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Users',
          style: context.xl18.weigh500,
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.space20,
            vertical: AppDimens.space20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius15),
            border: Border.all(
              color: AppColors.greyd2,
            ),
          ),
          child: Column(
              children: users.indexed.map((item) {
            var e = item.$2;
            var withgrey782 = context.md13.withgrey78;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppDimens.space5),
                Text('user:${item.$1 + 1}'),
                Table(
                  columnWidths: const {
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(children: [
                      TableCell(
                          child: Text(
                        'first name :',
                        style: withgrey782,
                      )),
                      TableCell(
                          child: Text(
                        e.fNameCtrl.text.trim(),
                        style: withgrey782,
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Text(
                        'Last name :',
                        style: withgrey782,
                      )),
                      TableCell(
                          child: Text(
                        e.lNameCtrl.text.trim(),
                        style: withgrey782,
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Text(
                        'Phone no :',
                        style: withgrey782,
                      )),
                      TableCell(
                          child: Text(
                        e.phoneCtrl.text.trim(),
                        style: withgrey782,
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Text(
                        'Date of birth :',
                        style: withgrey782,
                      )),
                      TableCell(
                          child: Text(
                        e.dobCtrl.text.trim(),
                        style: withgrey782,
                      )),
                    ]),
                  ],
                ),
              ],
            );
          }).toList()),
        ),
      ],
    );
  }
}
