import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/widget/app_icon_button.dart';
import 'package:ez_booking/features/events/controller/event_add_user_controller.dart';
import 'package:ez_booking/features/events/presentation/pages/event_detail_page.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventAddUserBs extends StatelessWidget {
  final EventModel eventModel;

  EventAddUserBs({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventAddUserController>(
      init: EventAddUserController(),
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              AppDimens.borderRadius15,
            ),
            topRight: Radius.circular(
              AppDimens.borderRadius15,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.space16, vertical: AppDimens.space20),
        child: Form(
          key: _.formKey,
          child: FormField<List<EventUser>>(
            validator: (value) {
              if (_.adultUser.isEmpty && _.childUser.isEmpty) {
                return 'Please add users';
              }
              return null;
            },
            initialValue: [
              ..._.childUser.toList(),
              ..._.adultUser.toList(),
            ],
            builder: (field) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(AppDimens.space15),
                Text(
                  'Choose number of persons',
                  style: context.lg16.weigh500,
                ),
                Gap(AppDimens.space10),
                Obx(
                  () => AddUserButtonItem(
                    count: _.adultUser.length,
                    title: 'Adult',
                    onAdd: () {
                      _.addUser();
                      var items = <EventUser>[];
                      items.assignAll(_.adultUser);
                      items.assignAll(_.childUser);
                      field.didChange(items);
                    },
                    onRemove: () {
                      _.removeUser();
                      var items = <EventUser>[];
                      items.assignAll(_.adultUser);
                      items.assignAll(_.childUser);
                      field.didChange(items);
                    },
                  ),
                ),
                const Gap(AppDimens.space15),
                Obx(
                  () => AddUserButtonItem(
                    count: _.childUser.length,
                    title: 'Child',
                    onAdd: () {
                      _.addChild();
                    },
                    onRemove: () {
                      _.removeChild();
                    },
                  ),
                ),
                if (field.hasError)
                  Text(
                    '${field.errorText}',
                    style: context.md14.withErrorRed,
                  ),
                Gap(AppDimens.space15),
                BookButton(
                  amount: eventModel.event_price,
                  onBookClick: () {
                    if (_.formKey.currentState!.validate()) {
                      _.submitUsers();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddUserButtonItem extends StatelessWidget {
  final int count;
  final String title;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const AddUserButtonItem(
      {super.key,
      required this.count,
      required this.title,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.lg16.weigh500,
          ),
        ),
        AppIconButton(
          borderRadius: 10,
          borderColor: AppColors.grey0f,
          onPressed: onRemove,
          child: const Icon(
            Icons.horizontal_rule,
            color: AppColors.primary,
          ),
        ),
        const Gap(AppDimens.space5),
        Text(
          '${count}'.padLeft(2, '0'),
        ),
        const Gap(AppDimens.space5),
        AppIconButton(
          onPressed: onAdd,
          borderRadius: 10,
          borderColor: AppColors.grey0f,
          child: const Icon(
            Icons.add,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
