import 'package:ez_booking/model/event_user_model.dart';

class AddUserBookingParam {
  int event_id;
  int user_id;
  int booked_by_id;
  int event_type;
  List<EventUser> users;
  double amount;
  double discount;
  double grand_total;
  int? time_slot_id;
  List<int> days;
  // String week_days;

  AddUserBookingParam({
    required this.event_id,
    required this.user_id,
    required this.booked_by_id,
    required this.event_type,
    required this.users,
    required this.amount,
    required this.discount,
    required this.grand_total,
    this.time_slot_id,
    required this.days,
    // required this.week_days,
  });

  Map<String, dynamic> toJson() {
    return {
      'event_id': this.event_id,
      'user_id': this.user_id,
      'booked_by_id': this.booked_by_id,
      'event_type': this.event_type,
      'users': this.users.map((e) => e.toMap()).toList(),
      'amount': this.amount,
      'grand_total': this.grand_total,
      if(this.days.isNotEmpty)
      'days': this.days.isEmpty?null:this.days,
      'discount': this.discount,
      'time_slot_id': this.time_slot_id,
      // 'week_days': this.week_days,
    };
  }
}
