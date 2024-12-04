import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/widget/app_bottomnavbar.dart';
import 'package:ez_booking/features/events/presentation/pages/event_detail_page.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/home/presentation/pages/one_time_exp.dart';
import 'package:ez_booking/features/home/presentation/pages/event_by_category.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:ez_booking/features/login/presentation/pages/verifiation_page.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/booking_details.dart';
import 'package:ez_booking/features/mybooking/presentation/pages/my_booking.dart';
import 'package:ez_booking/features/navbar/navbar_binding.dart';
import 'package:ez_booking/features/navbar/presentation/pages/navbar_screen.dart';
import 'package:ez_booking/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:ez_booking/features/profile/presentation/pages/profile_page.dart';
import 'package:ez_booking/features/review/presentation/pages/review.dart';
import 'package:ez_booking/features/rewards_and_offer/presentation/pages/reward_and_offer.dart';
import 'package:ez_booking/features/settings/presentation/pages/settings.dart';
import 'package:ez_booking/features/splash/presentation/pages/location_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/onboarding_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class RouteUtil {
  List<GetPage> route = [
    GetPage(name: RouteConfig.splash, page: () => const SplashPage()),
    GetPage(name: RouteConfig.onboarding, page: () => const OnboardingPage()),
    GetPage(name: RouteConfig.location, page: () => const LocationPage()),
    GetPage(
        name: RouteConfig.verification, page: () => const VerificationPage()),
    GetPage(
      name: RouteConfig.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteConfig.login,
      page: () => LoginPage(),
    ),
     GetPage(
      name: RouteConfig.eventByCateogry,
      page: () => const EventByCategoryPage(),
    ),
    GetPage(
      name: RouteConfig.events,
      page: () => const EventByCategoryPage(),
    ),
    GetPage(
      name: RouteConfig.eventDetail,
      page: () => const EventDetailPage(),
    ),
    GetPage(
      name: RouteConfig.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: RouteConfig.editUserProfile,
      page: () =>  EditProfilePage(),
    ),
    GetPage(
      name: RouteConfig.settings,
      page: () =>  const Settings(),
    ),
    GetPage(
      name: RouteConfig.rewardAndOffers,
      page: () =>  const RewardAndOffer(),
    ),
    GetPage(
      name: RouteConfig.review,
      page: () =>   const MyReviews(),
    ),
    GetPage(
      name: RouteConfig.myBooking,
      page: () =>   const MyBooking(),
    ),
    GetPage(
      name: RouteConfig.bookingDetails,
      page: () =>   const BookingDetails(),
    ),
    GetPage(
      name: RouteConfig.bottomNavBar,
      page: () =>   NavbarScreen(),
      binding: NavBarBinding(),
    ),
    
  ];
}
