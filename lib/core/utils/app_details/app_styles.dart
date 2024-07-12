import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  // final BuildContext context;
  // AppStyles({required this.context});

  static TextStyle styleReqular16 = TextStyle(
      color: Color(0xFFb5b3b2),
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w400);

  static TextStyle styleAppBar = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 22),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static TextStyle styleMedium16 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static TextStyle styleSemiBold16 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static TextStyle styleSemiBold20 = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static TextStyle styleSemiBold14 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static TextStyle styleReqular14 = TextStyle(
      color: Color(0xFFbbbbbc),
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w400);

  static TextStyle styleSemiBold24 = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 24),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static TextStyle styleSemiBold18 = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static TextStyle styleBold14 = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w700);

  static TextStyle styleBold16 = TextStyle(
      color: Color(0xFF393737),
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w700);

  static TextStyle styleMedium20 = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static TextStyle styleExtrallLight15 = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(fontSize: 15),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w200);

  static TextStyle styleSemiBold48 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: getResponsiveFontSize(fontSize: 48),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static TextStyle styleSemiBold38 = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 38),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static TextStyle styleSemiBold28 = TextStyle(
      color: Color(0xFF000000),
      fontSize: getResponsiveFontSize(fontSize: 28),
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);
}

double getResponsiveFontSize({required double fontSize}) {
  double scallFactor = getScallFactor();

  double responsiveFontSize = fontSize * scallFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScallFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalSize = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;

  double width = physicalSize / devicePixelRatio;

  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
