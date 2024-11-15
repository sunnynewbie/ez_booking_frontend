import 'package:ez_booking/features/home/presentation/pages/home_page.dart';
import 'package:ez_booking/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

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
      home: const HomePage(), 
    );
  }
}
