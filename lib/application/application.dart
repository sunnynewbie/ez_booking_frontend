import 'package:ez_booking/core/config/app_theme.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZ booking',
      theme: AppTheme().appThemeData,
    );
  }
}
