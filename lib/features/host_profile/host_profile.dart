import 'package:ez_booking/controller/host_profile_controller.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/features/host_profile/presentation/widget/host_name_and_icon_widget.dart';
import 'package:ez_booking/features/host_profile/presentation/widget/review_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostProfilePage extends StatelessWidget {
  const HostProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HostProfileController(),
      builder: (_) => Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          surfaceTintColor: AppColors.primary,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
        body: Obx(
          () => _.organizer.value == null
              ? const SizedBox()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            NameTile(
                              organizerModel: _.organizer.value!,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  visualDensity: VisualDensity.compact,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.borderRadius10),
                                    side: const BorderSide(
                                        color: AppColors.grey0f),
                                  ),
                                  title: Text(
                                      'Lives in ${_.organizer.value?.location}'),
                                ),
                              ),

                              const SizedBox(height: 20),
                              Obx(
                                () => OrganizerReviewList(
                                  reviews: _.eventsReviews.value?.reviews ?? [],
                                ),
                              ),
                              const SizedBox(height: 20),
                              OrganizationEvents(
                                eventModel: _.eventsReviews.value!.event ,
                              ),
                              // EventListing(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
