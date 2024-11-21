class NetworkUrl {
  static const baseUrl ='https://ezbooking-node.onrender.com/v1/';

  static const sendOtp='user/send-otp';
  static const verifyOtp='user/verify-otp';
  static const getUser='user/user/:id';
  static const getEvents='events/event';
  static const getEvent='events/event/:id';
  static const geCategories='events/event-categories';
  static const getTimeSlots='events/event/:id/time_slot';
  static const getBookings='events_booking/get_bookings';
  static const getBookingDetail='events_booking/booking/:id';
  static const createBooking='events_booking/booking/create_booking';
  static const updateUserInBooking='events_booking/booking/update_user';
}