import 'package:ez_booking/model/event_days.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_time_slot_model.dart';
import 'package:ez_booking/model/event_user_model.dart';

class EventSummeryArgs {
  EventModel eventModel;
  List<EventUser> users;
  List<EventDays> days;
  EventTimeSlotModel? selectedTime;

  EventSummeryArgs(
      {required this.eventModel,
      required this.users,
      this.days = const [],
      this.selectedTime});
}
