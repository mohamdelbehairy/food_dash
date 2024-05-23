import 'package:flutter/material.dart';

import 'login_view_component.dart';

class LoginViewSection extends StatefulWidget {
  const LoginViewSection({super.key, required this.size});

  final Size size;

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
    return Form(
      key: globalKey,
      child: LoginViewComponent(
          size: widget.size,
          email: email,
          password: password,
          globalKey: globalKey),
    );
  }
}
