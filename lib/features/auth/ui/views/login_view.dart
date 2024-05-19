import 'package:flutter/material.dart';
import 'package:food_dash/features/auth/ui/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: LoginvViewBody(size: size),
    );
  }
}
