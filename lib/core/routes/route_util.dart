import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/events/presentation/pages/event_chekout_page.dart';
import 'package:ez_booking/features/events/presentation/pages/event_detail_page.dart';
import 'package:ez_booking/features/events/presentation/pages/event_list_page.dart';
import 'package:ez_booking/features/events/presentation/pages/event_loading_page.dart';
import 'package:ez_booking/features/home/presentation/pages/event_by_category.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/home/presentation/pages/search_page.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:ez_booking/features/login/presentation/pages/verifiation_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/allow_location_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/location_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/onboarding_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class RouteUtil {
  List<GetPage> route = [
    GetPage(name: RouteConfig.splash, page: () => const SplashPage()),
    GetPage(name: RouteConfig.onboarding, page: () => const OnboardingPage()),
    GetPage(name: RouteConfig.location, page: () => const LocationPage()),
    GetPage(name: RouteConfig.loadingpage, page: () => const EventLoadingPage()),
    GetPage(
        name: RouteConfig.allowLocation, page: () => const AllowLocationPage()),
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
      page: () => const EventListPage(),
    ),
    GetPage(
      name: RouteConfig.eventDetail,
      page: () => const EventDetailPage(),
    ),
    GetPage(
      name: RouteConfig.search,
      page: () => const SearchPage(),
    ),GetPage(
      name: RouteConfig.addUserEvent,
      page: () => const EventCheckoutPage(),
    ),
  ];
}
