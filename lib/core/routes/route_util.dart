import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/events/pages/event_chekout_page.dart';
import 'package:ez_booking/features/events/pages/event_chekout_summery_page.dart';
import 'package:ez_booking/features/events/pages/event_detail_page.dart';
import 'package:ez_booking/features/events/pages/event_list_page.dart';
import 'package:ez_booking/features/events/pages/event_loading_page.dart';
import 'package:ez_booking/features/events/pages/event_order_success_page.dart';
import 'package:ez_booking/features/events/pages/event_review_page.dart';
import 'package:ez_booking/features/events/pages/regular_checkout_page.dart';
import 'package:ez_booking/features/home/presentation/pages/event_by_category.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:ez_booking/features/login/presentation/pages/verifiation_page.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_details.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/my_booking.dart';
import 'package:ez_booking/features/navbar/navbar_binding.dart';
import 'package:ez_booking/features/navbar/presentation/pages/navbar_screen.dart';
import 'package:ez_booking/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:ez_booking/features/profile/presentation/pages/profile_page.dart';
import 'package:ez_booking/features/review/presentation/pages/review_page.dart';
import 'package:ez_booking/features/rewards_and_offer/presentation/pages/reward_and_offer.dart';
import 'package:ez_booking/features/search/search_page.dart';
import 'package:ez_booking/features/settings/pages/policies_page.dart';
import 'package:ez_booking/features/settings/pages/privacy_detail_page.dart';
import 'package:ez_booking/features/settings/pages/settings.dart';
import 'package:ez_booking/features/splash/presentation/pages/allow_location_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/onboarding_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/selected_city_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class RouteUtil {
  List<GetPage> route = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingPage()),
    GetPage(name: AppRoutes.select_city, page: () => const SelectedCityPage()),
    GetPage(name: AppRoutes.loadingpage, page: () => const EventLoadingPage()),
    GetPage(
        name: AppRoutes.allowLocation, page: () => const AllowLocationPage()),
    GetPage(name: AppRoutes.verification, page: () => const VerificationPage()),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.eventByCateogry,
      page: () => const EventByCategoryPage(),
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => const EventListPage(),
    ),
    GetPage(
      name: AppRoutes.eventDetail,
      page: () => const EventDetailPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.editUserProfile,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
    ),
    GetPage(
      name: AppRoutes.addUserEvent,
      page: () => const EventCheckoutPage(),
    ),
    GetPage(
      name: AppRoutes.regularCheckout,
      page: () => const RegularCheckoutpage(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const Settings(),
    ),
    GetPage(
      name: AppRoutes.policies,
      page: () => const Policypage(),
    ),
    GetPage(
      name: AppRoutes.policyDetail,
      page: () => const PolicyDetailPage(),
    ),
    GetPage(
      name: AppRoutes.rewardAndOffers,
      page: () => const RewardAndOffer(),
    ),
    GetPage(
      name: AppRoutes.eventReviews,
      page: () => const EventReviewPage(),
    ),
    GetPage(
      name: AppRoutes.review,
      page: () => const MyReviews(),
    ),
    GetPage(
      name: AppRoutes.myBooking,
      page: () => const MyBooking(),
    ),
    GetPage(
      name: AppRoutes.bookingDetails,
      page: () => const BookingDetailspage(),
    ),
    GetPage(
      name: AppRoutes.eventSummeryPage,
      page: () => const EventCheckoutSummeryPage(),
    ),
    GetPage(
      name: AppRoutes.eventSuccess,
      page: () => const EventOrderSuccessPage(),
    ),
    GetPage(
      name: AppRoutes.eventFail,
      page: () => const EventOrderSuccessPage(),
    ),
    GetPage(
      name: AppRoutes.bottomNavBar,
      page: () => NavbarScreen(),
      binding: NavBarBinding(),
    ),
  ];
}
