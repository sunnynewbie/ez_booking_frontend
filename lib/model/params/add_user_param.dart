import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_user_model.dart';

class AddUserParam {
  EventModel eventModel;
  List<EventUser> users;

  AddUserParam({
    required this.eventModel,
    required this.users,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventModel': this.eventModel.toJson(),
      'events': this.users,
    };
  }
}
