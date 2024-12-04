class NetworkUrl {
  static const baseUrl ='https://ezbooking-node.onrender.com/v1/';
  static const imagePath ='https://ezbooking-node.onrender.com';

  static const sendOtp='user/send-otp';
  static const verifyOtp='user/verify-otp';
  static const getUser='user/user/:id';
  static const getEvents='events/event';
  static  getEvent(int id)=>'events/event/$id';
  static const geCategories='events/event-categories';
  static const getTimeSlots='events/event/:id/time_slot';
  static const getBookings='events_booking/get-bookings';
  static  getBookingDetail(int id)=>'events_booking/booking/$id';
  static const createOnTimeBooking='events_booking/booking/create-onetime-booking';
  static const createBooking='events_booking/booking/create-booking';
  static const updateUserInBooking='events_booking/booking/update-user';
  static const getDashboard= 'user/home';
  static const mainCategory= 'user/category';

static const updateUser= 'user/update-user/:id';
}