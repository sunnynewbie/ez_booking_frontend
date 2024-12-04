import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';

class EventSummeryArgs {
  EventModel eventModel;
  List<EventUser> users;
  EventSummeryArgs({
    required this.eventModel,
    required this.users,
  });
}
