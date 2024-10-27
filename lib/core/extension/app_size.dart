import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension CustomSize on BuildContext {
  /// Dynamic Height based on screen pixel ration

  double h(num height) {
    return height.toDouble();
  }

  // double h(num height) => height * (MediaQuery.of(this).size.height / 550);

  /// Dynamic Width based on screen pixel ration
  double w(num width) => isTablet ? width * 1.2 : width.toDouble();

  // double w(num width) => width * (MediaQuery.of(this).size.width / 360);
  bool get isTablet => MediaQuery.of(this).size.width > 500;

  double get getHeight => MediaQuery.of(this).size.height;

  double get getWidth => MediaQuery.of(this).size.width;
}

extension ScaleExtension on num {
/*  FlutterView get _window => PlatformDispatcher.instance.views.first;

double get _width => deviceWidth;

double get _height => deviceHeight;*/

  /// Dynamic Height based on screen pixel ration
  double get hs => px * scaleFactor; // istablet ?h: sp ?? (istablet ? w : h);

  /// Dynamic Width based on screen pixel ration
  double get ws => px * scaleFactor; // istablet ?h: sp ?? (istablet ? w : h);

  /// Dynamic font Size based on screen pixel ration
  double get fs => (istablet ? px : px) * textScalFactor;

  double get scaleFactor {
    Size size = PlatformDispatcher.instance.views.first.physicalSize /
        PlatformDispatcher.instance.views.first.devicePixelRatio;

    double baseWidth = 375.0;
    double screenWidth = size.width;

    // Calculate the scaling factor
    double scaleFactor = screenWidth / baseWidth;

    if (scaleFactor > 1.2) {
      scaleFactor = 1.2;
    } else if (scaleFactor < 1) {
      scaleFactor = 0.8;
    }
    return scaleFactor;
  }

  double get textScalFactor {
    Size size = PlatformDispatcher.instance.views.first.physicalSize /
        PlatformDispatcher.instance.views.first.devicePixelRatio;

    double baseWidth = 375.0;
    double screenWidth = size.width;

    // Calculate the scaling factor
    double scaleFactor = screenWidth / baseWidth;
    if (scaleFactor > 1.2) {
      scaleFactor = 1.2;
    } else if (scaleFactor < 1) {
      scaleFactor = 0.9;
    } else {
      scaleFactor = 1;
    }

    return scaleFactor;
  }
}

bool get istablet => Device.screenType == ScreenType.tablet;
