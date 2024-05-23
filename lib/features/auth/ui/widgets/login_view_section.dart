import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';

import 'login_view_component.dart';

class LoginViewSection extends StatefulWidget {
  const LoginViewSection(
      {super.key, required this.size, required this.isLoading});

  final Size size;
  final bool isLoading;

  @override
  State<LoginViewSection> createState() => _LoginViewSectionState();
}

class _LoginViewSectionState extends State<LoginViewSection> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailLoginCubit, EmailLoginState>(
      listener: (context, state) {
        if (state is EmailLoginSuccess) {
          email.clear();
          password.clear();
        }
      },
      child: Form(
        key: globalKey,
        child: LoginViewComponent(
            size: widget.size,
            isLoading: widget.isLoading,
            email: email,
            password: password,
            globalKey: globalKey),
      ),
    );
  }
}
