import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:food_dash/core/utils/components/custom_button_item.dart';
import 'package:food_dash/core/utils/components/divider_text_item.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/custom_text_item.dart';
import '../../../../core/utils/components/already_have_account_or_not.dart';
import 'auth_provider_ways.dart';
import 'register_list_view.dart';
import 'remember_me_item.dart';

class RegisterViewBodyComponent extends StatelessWidget {
  const RegisterViewBodyComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        drawSvgIconColored('app_icon1', height: 100, width: 100),
        const SizedBox(height: 20),
        CustomTextItem(
            style: AppStyles.styleSemiBold28, text: 'Create New Account'),
        const SizedBox(height: 16),
        RegisterListView(),
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
            onTap: () => GoRouter.of(context).push(AppRouter.loginView))
      ],
    );
  }
}
