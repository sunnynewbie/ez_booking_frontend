import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class RouteUtil {
  GoRouter route = GoRouter(routes: [
    GoRoute(
      path: RouteConfig.splash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.location,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.login,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.verification,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.homePage,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.profile,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.events,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.eventDetail,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.bookingList,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.bookingDetail,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.notifications,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: RouteConfig.settings,
      builder: (context, state) => SplashPage(),
    ),
  ]);
}