import 'package:ez_booking/core/config/app_textstyle.dart';
import 'package:ez_booking/features/events/controller/counter.dart';
import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:ez_booking/features/events/services/event_service_with_id.dart';
import 'package:ez_booking/features/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedContainer extends StatefulWidget {
  const ExpandedContainer({super.key});

  @override
  State<ExpandedContainer> createState() => _ExpandedContainerState();
}

class _ExpandedContainerState extends State<ExpandedContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final CounterController counterController = Get.put(CounterController());
    final SpecificEventController eventController =
        Get.put(SpecificEventController());

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.019,
                ),
                Text(
                  'Select Your Plan Of Booking',
                  style: AppTextStyle.regular5,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Adult",
                        style: AppTextStyle.regular5,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: counterController.decrement,
                          ),
                          Obx(
                            () => Text(
                              '${counterController.count.value}',
                              style: AppTextStyle.regular5,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: counterController.increment,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Adult",
                        style: AppTextStyle.regular5,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: counterController.decrement,
                          ),
                          Obx(
                            () => Text(
                              '${counterController.count.value}',
                              style: AppTextStyle.regular5,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: counterController.increment,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Price and Buy Now Section
          Container(
            height: size.height * 0.09,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.02),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  if (eventController.event.value != null) {
                    return Text(
                      "\₹ ${eventController.event.value!.eventPrice}",
                      style: AppTextStyle.pagetitle,
                    );
                  } else {
                    return const Text("Price not available");
                  }
                }),
                GestureDetector(
                  onTap: () {},
                  child: CustomButtom(
                    text: "Buy Now",
                    height: size.height * 0.08,
                    width: size.width * 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
