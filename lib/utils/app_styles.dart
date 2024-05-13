import 'package:flutter/material.dart';

abstract class AppStyles {
  // final BuildContext context;
  // AppStyles({required this.context});

  static const TextStyle styleReqular16 = TextStyle(
      color: Color(0xFF575658),
      fontSize: 16,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w400);

  static const TextStyle styleMedium16 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: 16,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static const TextStyle styleSemiBold16 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: 16,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static const TextStyle styleSemiBold20 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 20,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static const TextStyle styleReqular12 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: 12,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w400);

  static const TextStyle styleReqular14 = TextStyle(
      color: Color(0xFFbbbbbc),
      fontSize: 14,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w400);

  static const TextStyle styleSemiBold24 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 24,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static const TextStyle styleSemiBold18 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 18,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static const TextStyle styleBold16 = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 16,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w700);

  static const TextStyle styleMedium20 = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 20,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500);

  static const TextStyle styleSemiBold48 = TextStyle(
      color: Color(0xFF35be63),
      fontSize: 48,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  static const TextStyle styleBold30 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 30,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w700);

  static const TextStyle styleSemiBold28 = TextStyle(
      color: Color(0xFF000000),
      fontSize: 28,
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w600);

  // double getResponsiveFontSize({required double fontSize}) {
  //   double scallFactor = getScallFactor(context);

  //   double responsiveFontSize = fontSize * scallFactor;
  //   double lowerLimit = fontSize * .8;
  //   double upperLimit = fontSize * 1.2;

  //   return responsiveFontSize.clamp(lowerLimit, upperLimit);
  // }

  // double getScallFactor(BuildContext context) {
  //   double widget = MediaQuery.sizeOf(context).width;

  //   if (widget < 600) {
  //     return widget / 400;
  //   } else if (widget < 900) {
  //     return widget / 700;
  //   } else {
  //     return widget / 1000;
  //   }
  // }
}
