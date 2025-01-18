class NetworkUrl {
  static const baseUrl = 'https://ezbooking-node.onrender.com/v1/';
  static const imagePath = 'https://ezbooking-node.onrender.com';

  static const sendOtp = 'user/send-otp';
  static const createGuestLogin = 'user/create-guest-user';
  static const setCity = 'user/set-city';
  static const getCities = 'user/cities';
  static const verifyFirebseLogin = 'user/verify-firebase-login';
  static  getUser(int id)=> 'user/user/$id';
  static const getEvents = 'events/event';

  static getEvent(int id) => 'events/event/$id';
  static organizer(num id) => 'events/organizer/$id';
  static const getCategories = 'events/event-categories';
  static const exploreCategories = 'events/explore-categories';

  static getTimeSlots(int id) => 'events/event/$id/time_slot';
  static const getBookings = 'events_booking/get-bookings';
  static const upcomingBookings = 'events_booking/get-upcoming-bookings';

  static getBookingDetail(int id) => 'events_booking/booking/$id';
  static const createOnTimeBooking =
      'events_booking/booking/create-onetime-booking';
  static const createBooking = 'events_booking/booking/create-booking';
  static const updateUserInBooking = 'events_booking/booking/update-user';
  static const verifyPayment = 'events_booking/booking/verify-payment';
  static const getDashboard = 'user/home';
  static const mainCategory = 'user/category';
  static const getMostBooked = 'user/get-most-booked';
  static const getPrice = 'events_booking/booking/get-price';

  static const updateUser = 'user/update-user/:id';
  static const addReview = 'review/add-review';
  static const getReviews = 'review/get-reviews';
  static const getEventReviews = 'review/get-event-reviews';
  static const userReviews = 'review/user-reviews';
  static const searchAPI ='app/search';

//policies
  static const getPolicies = 'app/terms-privacy';

  static getPoliciesContent(num id) => 'app/get-term-privacy-content/$id';
}
