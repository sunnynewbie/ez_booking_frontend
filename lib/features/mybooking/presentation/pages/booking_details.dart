import 'package:ez_booking/controller/booking_detail_controller.dart';
import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/utils/animte_ext.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_scaffold.dart';
import 'package:ez_booking/features/events/widget/booking_event_item.dart';
import 'package:ez_booking/features/events/widget/event_summery_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BookingDetailspage extends StatelessWidget {
  const BookingDetailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailController>(
      init: BookingDetailController(),
      builder: (_) => AppScaffold(
        appBar: AppBar(
          title: Text(
            'Booking Details',
            style: TextStyle(
                color: Colors.black,
                fontFamily: AppFont.lexend,
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
            ()=> Padding(
                  padding: EdgeInsets.all(AppDimens.space15),
                  child: _.bookingDetail.value == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(AppDimens.space15),
                            ListTile().shimmerEffect(
                                height: 90, width: double.maxFinite),
                            Gap(AppDimens.space30),
                            SizedBox().shimmerEffect(),
                            Gap(AppDimens.space10),
                            SizedBox().shimmerEffect(
                                height: 180, width: double.maxFinite),
                            Gap(AppDimens.space30),
                            SizedBox().shimmerEffect(),
                            Gap(AppDimens.space10),
                            SizedBox().shimmerEffect(
                                height: 180, width: double.maxFinite),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => _.bookingDetail.value == null
                                  ? SizedBox()
                                  : BookingEventItem(
                                      eventTitle:
                                          _.bookingDetail.value!.event.event_name,
                                      eventImage: '',
                                      eventAddress:
                                          _.bookingDetail.value!.event.address,
                                      evetnDate:
                                          _.bookingDetail.value!.booking_date,
                                    ),
                            ),
                            SizedBox(height: 15),
                            Obx(
                              () => _.bookingDetail.value == null
                                  ? SizedBox()
                                  : EventSummeryWidget(
                                      title: "Booking details",
                                      content: [
                                        RowContent(
                                            title: 'Duration',
                                            content: _
                                                .bookingDetail.value!.booking_date
                                                .toIso8601String(),
                                            titleStyle: context.md14.withgrey78,
                                            contentStyle: context.md14.weigh500),
                                        RowContent(
                                            title: 'Location',
                                            content: _.bookingDetail.value!.event
                                                .address,
                                            titleStyle: context.md14.withgrey78,
                                            contentStyle: context.md14.weigh500),
                                        RowContent(
                                            title: "Time",
                                            content: '',
                                            titleStyle: context.md14.withgrey78,
                                            contentStyle: context.md14.weigh500)
                                      ],
                                    ),
                            ),
                            SizedBox(height: 15),
                            EventSummeryWidget(
                              title: 'Price details',
                              content: [
                                RowContent(
                                    title: 'Subtotal',
                                    content: '',
                                    titleStyle: context.md14.withgrey78,
                                    contentStyle: context.md14.withgrey78),
                                RowContent(
                                    title: 'Tax',
                                    content: '',
                                    titleStyle: context.md14.withgrey78,
                                    contentStyle: context.md14.withgrey78),
                                RowContent(
                                    title: 'Grand Total',
                                    content: '',
                                    titleStyle: context.lg16.weigh500,
                                    contentStyle: context.lg16.weigh500)
                              ],
                            ),
                            Gap(AppDimens.space30),
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppDimens.space15),
              child: AppElevatedButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildCancelDialogue(context);
                    },
                  );
                },
                borderRadius: 15,
                height: AppDimens.space40,
                width: double.infinity,
                text: 'Cancel Booking',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontFamily: AppFont.lexend,
              fontWeight: FontWeight.w700,
              fontSize: 15),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.1),
          ),
          child: Column(children: content),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                color: AppColors.grey78.withOpacity(0.7),
                fontFamily: AppFont.lexend,
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.black,
                fontFamily: AppFont.lexend,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelDialogue(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Reduced circular radius
          ),
        ),
      ),
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                height: 40,
                width: 40,
                child: Image.asset(
                  AppAssets.bookingIcon,
                  scale: 4,
                ),
              ),
              Text(
                'Do you want to cancel booking?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Go back to login and use that password to use login again',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 20),
              AppElevatedButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                width: double.infinity,
                height: 42,
                borderRadius: 15,
                text: 'Yes',
              ),
              SizedBox(height: 15),
              AppElevatedButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                width: double.infinity,
                height: 42,
                borderRadius: 15,
                text: 'No',
                borderColor: Colors.grey.withOpacity(0.4),
                buttonColor: Colors.white,
                fontColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
