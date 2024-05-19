import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/components/custom_button_item.dart';
import 'package:food_dash/core/utils/components/divider_text_item.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/custom_text_item.dart';
import '../../../../core/utils/components/already_have_account_or_not.dart';
import 'auth_provider_ways.dart';
import 'list_view_text_field.dart';
import 'remember_me_item.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          drawSvgIconColored('app_icon1', height: 100, width: 100),
          const SizedBox(height: 20),
          CustomTextItem(
              style: AppStyles.styleSemiBold28, text: 'Create New Account'),
          const SizedBox(height: 16),
          ListViewTextField(),
          RememberMeItem(),
          const SizedBox(height: 16),
          CustomButtonItem(size: size, buttonName: 'Sign up', onTap: () {}),
         
          DividerTextitem(
              dividerSize: size.width * .25, text: 'or continue with'),
          AuthProviderWays(size: size),
          const SizedBox(height: 16),
          AlreadyHaveAccountOrNot(
              text: 'Already have an account?',
              textButton: 'Sign in',
              onTap: () {})
        ],
      ),
    );
  }
}
