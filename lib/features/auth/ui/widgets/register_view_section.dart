import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';

import 'register_view_component.dart';

class RegisterViewSection extends StatefulWidget {
  const RegisterViewSection(
      {super.key, required this.size, required this.isLoading});

  final Size size;
  final bool isLoading;

  @override
  State<RegisterViewSection> createState() => _RegisterViewSectionState();
}

class _RegisterViewSectionState extends State<RegisterViewSection> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailRegisterCubit, EmailRegisterState>(
      listener: (context, state) {
        if (state is EmailRegisterSuccess) {
          email.clear();
          password.clear();
          confirmPassword.clear();
        }
      },
      child: Form(
        key: globalKey,
        child: RegisterViewComponent(
            widget: widget,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            globalKey: globalKey),
      ),
    );
  }
}
