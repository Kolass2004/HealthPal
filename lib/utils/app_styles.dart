import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_pal/utils/constants.dart';

abstract class Appstyles {
  static TextStyle styleRegular14 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 14),
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static TextStyle styleRegular12 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 12),
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static TextStyle styleMedium14 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 14),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static TextStyle styleSemiBold14 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 14),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static TextStyle styleRegular20 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 20),
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static TextStyle styleBold18 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 18),
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle styleMedium16 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 16),
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static TextStyle styleBold16 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 16),
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle styleSemiBold20 = TextStyle(
    fontSize: getResponsiveFontSize(fontsize: 20),
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}

double getResponsiveFontSize({required double fontsize}) {
  double scaleFactor = getScaleFactor(fontsize);
  double responsiveFontSize = fontsize * scaleFactor;

  double lowerLimit = fontsize * 0.5;
  double upperLimit = fontsize * 1.3;

  responsiveFontSize = responsiveFontSize.clamp(lowerLimit, upperLimit);

  return responsiveFontSize;
}

double getScaleFactor(double fontsize) {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  var width = physicalWidth / devicePixelRatio;

  return width / 380;
}
