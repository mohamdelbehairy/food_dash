import 'package:flutter/material.dart';

import 'register_view_body_component.dart';


class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: RegisterViewBodyComponent(size: size),
      ),
    );
  }
}

