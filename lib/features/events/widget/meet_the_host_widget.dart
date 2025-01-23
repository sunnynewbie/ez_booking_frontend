import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetTheHostWidget extends StatelessWidget {
  final Organizer? organizer;

  const MeetTheHostWidget({Key? key, required this.organizer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return organizer == null
        ? const SizedBox.shrink()
        : Container(
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.hostProfilePage,
                        arguments: organizer!.instructor_id);
                  },
                  // onTap: () => Get.toNamed('/host-profile', arguments: host['id']),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.borderColor)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 23,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${organizer!.f_name} ${organizer!.l_name}",
                                  style: context.lg16.weigh500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
