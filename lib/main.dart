import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/home/presentation/pages/one_time_exp.dart';
import 'package:ez_booking/features/home/presentation/pages/regular_exp.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: RouteConfig.homePage,
          page: () => const HomePage(),
        ),
        GetPage(
          name: RouteConfig.login,
          page: () => const LoginPage(),
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
      ],
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _checkAuthToken(); // Check auth token on initialization
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Loading indicator
      ),
    );
  }

  Future<void> _checkAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');

    if (authToken == null || authToken.isEmpty) {
      Get.offNamed(RouteConfig.login); // Navigate to Login Page
    } else {
      Get.offNamed(RouteConfig.homePage); // Navigate to Home Page
    }
  }
}
