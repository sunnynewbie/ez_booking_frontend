import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/extension/common_extension.dart';
import 'package:ez_booking/core/extension/text_style_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:ez_booking/core/widget/app_image_view.dart';
import 'package:ez_booking/features/events/controller/event_order_controller.dart';
import 'package:ez_booking/features/events/pages/even_add_user_bs.dart';
import 'package:ez_booking/features/events/widget/event_summery_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EventOrderSuccessPage extends StatelessWidget {
  const EventOrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventOrderController>(
      init: EventOrderController(),
      builder: (_) => PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if(didPop){
            return;
          }
          Get.off(AppRoutes.bottomNavBar);
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space16,
              vertical: AppDimens.space20,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ImageView(
                        imageType: ImageType.asset,
                        path: _.isBooked
                            ? AppAssets.orderSuccess
                            : AppAssets.orderFail,
                        height: AppDimens.imageSize80,
                        width: AppDimens.imageSize80,
                      ),
                      Gap(AppDimens.space30),
                      Text(
                        _.isBooked ? 'payment successful' : 'payment failed',
                        style: context.x22.weigh500,
                      ),
                      Gap(AppDimens.space10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    _.isBooked ? 'successfully paid ' : 'Failed'),
                            TextSpan(
                              text: 'amount',
                            ),
                          ],
                        ),
                      ),
                      Gap(AppDimens.space20),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          var item =_.bookings.elementAt(index);
                          return EventSummeryWidget(
                            title: 'Payment details',
                            content: [
                              RowContent(
                                  title: '',
                                  content: '',
                                  titleStyle: context.md14.withgrey78,
                                  contentStyle: context.lg16),
                              RowContent(
                                  title: 'date',
                                  content: '${item.booking_date.ddMMyyyy}',
                                  titleStyle: context.md14.withgrey78,
                                  contentStyle: context.lg16),
                              RowContent(
                                  title: 'Type of payment',
                                  content: '',
                                  titleStyle: context.md14.withgrey78,
                                  contentStyle: context.lg16),
                              RowContent(
                                  title: 'Status',
                                  content: '${item.booking_status}',
                                  titleStyle: context.md14.withgrey78,
                                  contentStyle: context.lg16),
                              RowContent(
                                  title: 'time',
                                  content: '',
                                  titleStyle: context.md14.withgrey78,
                                  contentStyle: context.lg16),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Gap(AppDimens.space15),
                        itemCount: _.bookings.length),
                  ),
                  AppElevatedButton(
                    text: 'Go to booking',
                    width: double.maxFinite,
                    onTap: () {
                      Get.offNamedUntil(AppRoutes.bottomNavBar, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
