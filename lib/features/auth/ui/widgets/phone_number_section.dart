import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/widgets/already_have_account_or_not.dart';
import '../../../../core/utils/widgets/divider_text_item.dart';
import 'auth_provider_ways.dart';
import 'phone_number_view_column_two.dart';
import 'phone_number_view_column_one.dart';

class PhoneNumberSection extends StatelessWidget {
  const PhoneNumberSection(
      {super.key,
      required this.size,
      required this.isValue,
      required this.controller,
      this.onChangedPhoneNumber,
      required this.number,
      required this.text});

  final Size size;
  final bool isValue;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChangedPhoneNumber;

  final String number, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PhoneNumberViewColumnOne(
            text: text,
            onChangedPhoneNumber: onChangedPhoneNumber,
            size: size,
            isValue: isValue,
            controller: controller),
        PhoneNumberViewColumnTwo(
            controller: controller, size: size, number: number),
        DividerTextitem(
            dividerSize: size.width * .25, text: 'or continue with'),
        AuthProviderWays(
            size: size,
            icon: Icons.email,
            onTap: () => GoRouter.of(context).push(AppRouter.registerView)),
        const SizedBox(height: 16),
        AlreadyHaveAccountOrNot(
            text: text == 'Create New Account'
                ? 'Already have an account?'
                : 'Don\'t have an account?',
            textButton: text == 'Create New Account' ? 'Sign in': 'Sign up',
            onTap: () {
              if (text == 'Create New Account') {
                GoRouter.of(context).push(AppRouter.loginPhoneNumber);
              } else {
                GoRouter.of(context).push(AppRouter.registerPhoneNumber);
              }
            })
      ],
    );
  }
}
