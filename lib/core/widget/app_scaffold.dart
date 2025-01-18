import 'package:ez_booking/core/config/app_assets.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    super.key,
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.commonBg,
            ),
            repeat: ImageRepeat.repeatX,
            opacity: .5,
          ),
        ),
        child: body,
      ),
    );
  }
}
