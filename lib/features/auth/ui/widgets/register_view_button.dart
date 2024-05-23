import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';

import '../../../../core/utils/components/custom_button_item.dart';

class RegisterViewButton extends StatelessWidget {
  const RegisterViewButton(
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
    var emailRegister = context.read<EmailRegisterCubit>();
    return CustomButtonItem(
        isLoading: isLoading,
        size: size,
        buttonName: 'Sign up',
        onTap: () async {
          if (globalKey.currentState!.validate()) {
            globalKey.currentState!.save();
            debugPrint('email: ${email.text}, password: ${password.text}');
            await emailRegister.emailRegister(
                email: email.text, password: password.text);
          }
        });
  }
}
