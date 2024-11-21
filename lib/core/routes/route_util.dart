import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/home/presentation/pages/one_time_exp.dart';
import 'package:ez_booking/features/home/presentation/pages/regular_exp.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:ez_booking/features/login/presentation/pages/verifiation_page.dart';
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
      name: RouteConfig.oneTimeExperience,
      page: () => const OneTimeExperience(),
    ),
    GetPage(
      name: RouteConfig.regularExperience,
      page: () => const RegularExperience(),
    ),
    GetPage(
      name: RouteConfig.events,
      page: () => const RegularExperience(),
    ),
  ];
}
