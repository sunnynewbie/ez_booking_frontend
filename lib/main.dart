import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/routes/route_util.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils().initSharedPrefrence();
  runApp(const MyApp());
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
    Get.put( Appservice());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        initialRoute: RouteConfig.splash,
        getPages: RouteUtil().route,
      ),
    );
  }
}
