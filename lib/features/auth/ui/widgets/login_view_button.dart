import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';
import 'package:food_dash/features/auth/logic/remember_me/remember_me_cubit.dart';
import 'package:food_dash/features/auth/logic/user_shared_pref/user_shared_pref_cubit.dart';

import '../../../../core/utils/widgets/custom_button_item.dart';

class LoginViewButton extends StatelessWidget {
  const LoginViewButton(
      {super.key,
      required this.size,
      required this.globalKey,
      required this.email,
      required this.password,
      required this.isLoading,
      required this.isClick});

  final Size size;
  final GlobalKey<FormState> globalKey;
  final TextEditingController email, password;
  final bool isLoading;
  final RememberMeCubit isClick;

  @override
  Widget build(BuildContext context) {
    var loginRegister = context.read<EmailLoginCubit>();
    var userSharedPref = context.read<UserSharedPrefCubit>();
    return CustomButtonItem(
        size: size,
        isLoading: isLoading,
        buttonName: 'Sign in',
        onTap: () async {
          if (globalKey.currentState!.validate()) {
            globalKey.currentState!.save();
            debugPrint('email: ${email.text}, password: ${password.text}');
            await loginRegister.emailLogin(
                email: email.text, password: password.text);
            if (isClick.isClick) {
              await userSharedPref.userSharedPref();
            }
          }
        });
  }
}
