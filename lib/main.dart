import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/routes/route_util.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/home/presentation/pages/one_time_exp.dart';
import 'package:ez_booking/features/home/presentation/pages/event_by_category.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:ez_booking/features/splash/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils().initSharedPrefrence();
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
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Lexend'
      ),
      initialRoute: RouteConfig.splash,
      getPages:RouteUtil().route,
    );
  }
}
