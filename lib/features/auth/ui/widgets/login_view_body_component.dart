import 'package:flutter/material.dart';
import 'package:food_dash/features/auth/ui/widgets/login_list_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/already_have_account_or_not.dart';
import '../../../../core/utils/components/custom_button_item.dart';
import '../../../../core/utils/components/custom_text_item.dart';
import '../../../../core/utils/components/divider_text_item.dart';
import 'auth_provider_ways.dart';
import 'remember_me_item.dart';

class LoginViewBodyComponenet extends StatelessWidget {
  const LoginViewBodyComponenet({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 90),
        drawSvgIconColored('app_icon1', height: 100, width: 100),
        const SizedBox(height: 32),
        CustomTextItem(
            style: AppStyles.styleSemiBold28, text: 'Login to Your Account'),
        const SizedBox(height: 28),
        LoginListView(),
        RememberMeItem(),
        const SizedBox(height: 16),
        CustomButtonItem(size: size, buttonName: 'Sign in', onTap: () {}),
        DividerTextitem(
            dividerSize: size.width * .25, text: 'or continue with'),
        AuthProviderWays(size: size),
        const SizedBox(height: 16),
        AlreadyHaveAccountOrNot(
            text: 'Don\'t have an account?',
            textButton: 'Sign up',
            onTap: () => GoRouter.of(context).push(AppRouter.registerView))
      ],
    );
  }
}
