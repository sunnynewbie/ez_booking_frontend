import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/config/app_constant.dart';
import 'package:ez_booking/core/extension/common_extension.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/core/utils/razor_pay_util.dart';
import 'package:ez_booking/core/widget/app_toast.dart';
import 'package:ez_booking/features/events/controller/event_order_controller.dart';
import 'package:ez_booking/features/events/controller/event_summery_args.dart';
import 'package:ez_booking/model/event_days.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_price_model.dart';
import 'package:ez_booking/model/event_time_slot_model.dart';
import 'package:ez_booking/model/event_user_model.dart';
import 'package:ez_booking/model/params/add_user_booking_param.dart';
import 'package:ez_booking/model/params/event_price_param.dart';
import 'package:ez_booking/model/params/payment_param.dart';
import 'package:ez_booking/model/params/updated_bookng_param.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class EventSummeryController extends GetxController {
  late Rx<EventModel> event;
  RxList<EventUser> users = RxList.empty();
  RxBool isLoading = RxBool(false);
  RxList<EventDays> days = RxList.empty();
  Rxn<EventTimeSlotModel> timeSlots = Rxn();
  Rxn<EventPriceModel> price = Rxn();

  @override
  void onInit() {
    var args = Get.arguments as EventSummeryArgs;
    days.value = args.days;
    timeSlots.value = args.selectedTime;
    event = Rx(args.eventModel);
    users.assignAll(args.users);
    super.onInit();
    Future.delayed(Duration.zero, () {
      getPrice();
    });
  }

  createBooking() async {
    isLoading.value = true;
    var user = PrefUtils().getUser();
    if (user != null) {
      var param = AddUserBookingParam(
          amount: event.value!.total_amount.toDouble(),
          discount: 0,
          grand_total: price.value!.total_amount.toDouble(),
          days: days.map((element) => element.value.toInt()).toList(),
          // week_days: ,
          event_id: event.value!.event_id.toInt(),
          user_id: user.id,
          time_slot_id: timeSlots.value?.time_slot_id.toInt(),
          booked_by_id: user.id,

          event_type: event.value!.event_type.toInt(),
          users: users.toList());
      var response = await ApiRepository().createOneTmeBooking(param);
      if (response.status) {
        PaymentParam param = PaymentParam(
            bookingId: response.data!.list.first.booking_id.toInt(),
            sub_booking_id: response.data!.list.first.sub_booking_id,
            amount: event.value.total_amount.toInt(),
            orderId: response.data!.order.id,
            personName: Appservice.instance.user!.value!.displayName,
            personNumber: Appservice.instance.user.value!.phone_no,
            eventName: event.value.event_name,
            description: "Price ${event.value.event_price.toMoney} per person");
        var updateParam = UpdateBookingParam(
            bookingId: response.data!.list.first.parent_booking_id, status: '');
        var razorPayUtil = RazorPayUtil(
          onpaymentSuccess: (PaymentSuccessResponse response) {
            updateParam.status = 'booked';
            updatePayment(updateParam);
          },
          onPaymentError: (PaymentFailureResponse response) {
            updateParam.status = 'cancel';
            updatePayment(updateParam);
          },
          onExternalWallet: (ExternalWalletResponse response) {
            isLoading.value = false;
          },
        );

        razorPayUtil.startCheckOut(param);

        // Get.snackbar(AppConstant.appName, 'Booking completed');
        // Get.toNamed(AppRoutes.bottomNavBar);
      } else {
        isLoading.value = false;

        ShowToast.showErrorMsg( response.message ?? '');
      }
    }
  }

  Future<void> updatePayment(UpdateBookingParam param) async {
  isLoading.value=true;
    var response = await ApiRepository().approveRejectBooking(param);

    isLoading.value = false;
    if (response.status) {
      var arguments = EventOrderArgs(
          orderStatus: param.status, bookings: response.data ?? []);

      Get.offNamedUntil(AppRoutes.eventSuccess, (route) => false,
          arguments: arguments);
    }
  }

  Future<void> getPrice() async {
   isLoading.value=true;
    var param = EventPriceParam(
        event_id: event.value.event_id.toInt(), user_count: users.length);
    var response = await ApiRepository().getPrice(param);
    isLoading.value=false;
    if (response.status) {
      price.value = response.data;
    }
  }
}
