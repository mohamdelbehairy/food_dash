import 'package:flutter/material.dart';
import 'package:food_dash/features/auth/ui/widgets/login_view_body_component.dart';

class LoginvViewBody extends StatelessWidget {
  const LoginvViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: LoginViewBodyComponenet(size: size)),
    );
  }
}
