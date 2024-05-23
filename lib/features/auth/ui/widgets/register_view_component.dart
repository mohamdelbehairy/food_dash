import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/already_have_account_or_not.dart';
import '../../../../core/utils/components/custom_text_item.dart';
import '../../../../core/utils/components/divider_text_item.dart';
import 'auth_provider_ways.dart';
import 'register_list_view.dart';
import 'register_view_button.dart';
import 'register_view_section.dart';

class RegisterViewComponent extends StatelessWidget {
  const RegisterViewComponent(
      {super.key,
      required this.widget,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.globalKey});

  final RegisterViewSection widget;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        drawSvgIconColored('app_icon1', height: 100, width: 100),
        const SizedBox(height: 20),
        CustomTextItem(
            style: AppStyles.styleSemiBold28, text: 'Create New Account'),
        const SizedBox(height: 16),
        RegisterListView(
            isLoading: widget.isLoading,
            email: email,
            password: password,
            confirmPassword: confirmPassword),
        // RememberMeItem(),
        const SizedBox(height: 16),
        RegisterViewButton(
            isLoading: widget.isLoading,
            size: widget.size,
            globalKey: globalKey,
            email: email,
            password: password),
        DividerTextitem(
            dividerSize: widget.size.width * .25, text: 'or continue with'),
        AuthProviderWays(size: widget.size),
        const SizedBox(height: 16),
        AlreadyHaveAccountOrNot(
            text: 'Already have an account?',
            textButton: 'Sign in',
            onTap: () => GoRouter.of(context).push(AppRouter.loginView))
      ],
    );
  }
}
