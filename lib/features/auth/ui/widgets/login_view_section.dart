import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';

import '../../../../constants.dart';
import 'login_view_component.dart';

class LoginViewSection extends StatefulWidget {
  const LoginViewSection(
      {super.key,
      required this.size,
      required this.isLoading,
      required this.isUserData});

  final Size size;
  final bool isLoading;
  final Future<bool> isUserData;

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
      listener: (context, state) async {
        if (state is EmailLoginSuccess &&
            await widget.isUserData &&
            Constants.currentUser.emailVerified) {
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
