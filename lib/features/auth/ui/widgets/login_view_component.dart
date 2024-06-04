import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/remember_me/remember_me_cubit.dart';
import 'package:food_dash/features/auth/ui/widgets/login_list_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/already_have_account_or_not.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../../../core/utils/widgets/divider_text_item.dart';
import 'auth_provider_ways.dart';
import 'login_view_button.dart';
import 'remember_me_item.dart';

class LoginViewComponent extends StatelessWidget {
  const LoginViewComponent(
      {super.key,
      required this.size,
      required this.email,
      required this.password,
      required this.globalKey,
      required this.isLoading});

  final Size size;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> globalKey;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var isClick = context.read<RememberMeCubit>();
    return BlocBuilder<RememberMeCubit, RememberMeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: size.height * .05),
            drawSvgIconColored('app_icon1', height: 100, width: 100),
            const SizedBox(height: 32),
            CustomTextItem(
                style: AppStyles.styleSemiBold28,
                text: 'Login to Your Account'),
            const SizedBox(height: 28),
            LoginListView(
                email: email, password: password, isLoading: isLoading),
            RememberMeItem(isClick: isClick),
            const SizedBox(height: 16),
            LoginViewButton(
                isClick: isClick,
                isLoading: isLoading,
                size: size,
                email: email,
                password: password,
                globalKey: globalKey),
            DividerTextitem(
                dividerSize: size.width * .25, text: 'or continue with'),
            AuthProviderWays(
                size: size,
                icon: Icons.phone,
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.loginPhoneNumber)),
            const SizedBox(height: 16),
            AlreadyHaveAccountOrNot(
                text: 'Don\'t have an account?',
                textButton: 'Sign up',
                onTap: () => GoRouter.of(context).push(AppRouter.registerView))
          ],
        );
      },
    );
  }
}
