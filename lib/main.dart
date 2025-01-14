import 'package:ez_booking/core/config/analytic_tracker.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/routes/route_util.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PrefUtils().initSharedPrefrence();

  Get.putAsync(() => Appservice().init()).whenComplete(() {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ToastificationWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Lexend',
            appBarTheme: AppBarTheme(
                color: Colors.white,
                titleSpacing: 0,
                surfaceTintColor: Colors.white),
          ),
          initialRoute: AppRoutes.splash,
          getPages: RouteUtil().route,
          navigatorObservers: [AnalyticsRouteObserver()],
        ),
      ),
    );
  }
}
