import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';

import '../../../../core/utils/components/custom_button_item.dart';

class LoginViewButton extends StatelessWidget {
  const LoginViewButton(
      {super.key,
      required this.size,
      required this.globalKey,
      required this.email,
      required this.password,
      required this.isLoading});

  final Size size;
  final GlobalKey<FormState> globalKey;
  final TextEditingController email, password;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var loginRegister = context.read<EmailLoginCubit>();
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
          }
        });
  }
}
