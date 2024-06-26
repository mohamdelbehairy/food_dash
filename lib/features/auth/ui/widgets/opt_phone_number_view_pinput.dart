import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/app_details/app_colors.dart';

class OptPhoneNumberViewPinput extends StatelessWidget {
  const OptPhoneNumberViewPinput(
      {super.key, this.onCompleted, required this.controller});
  final void Function(String)? onCompleted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Pinput(
          length: 6,
          controller: controller,
          onCompleted: onCompleted,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyDecorationWith(
              border: Border.all(color: AppColors.mainColor),
              color: AppColors.textFieldFocusColor),
          submittedPinTheme: defaultPinTheme.copyDecorationWith(
              border: Border.all(color: AppColors.textFieldHintColor),
              color: AppColors.textFieldFillColor)),
    );
  }

  static final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.textFieldFillColor));
}
