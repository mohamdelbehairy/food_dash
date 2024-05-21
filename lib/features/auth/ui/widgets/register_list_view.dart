import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/models/text_field_model.dart';
import 'auth_list_view.dart';

class RegisterListView extends StatefulWidget {
  const RegisterListView({super.key});

  @override
  State<RegisterListView> createState() => _RegisterListViewState();
}

class _RegisterListViewState extends State<RegisterListView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  Color? emailFillColor;
  Color? passwordFillColor;
  Color? confirmPasswordFillColor;
  Color? emailBorderSideColor;
  Color? passwordBorderSideColor;
  Color? confirmPasswordBorderSideColor;

  @override
  Widget build(BuildContext context) {
    List<TextFieldModel> items = [
      TextFieldModel(
          hintText: 'Email',
          prefixIcon: FontAwesomeIcons.solidEnvelope,
          keyboardType: TextInputType.emailAddress,
          controller: email,
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                emailFillColor = AppColors.textFieldFocusColor;
                emailBorderSideColor = AppColors.mainColor;
              } else {
                emailFillColor = AppColors.textFieldFillColor;
                emailBorderSideColor = Colors.transparent;
              }
            });
          },
          fillColor: emailFillColor,
          borderSideColor: emailBorderSideColor),
      TextFieldModel(
          hintText: 'Password',
          prefixIcon: Icons.password,
          obscureText: true,
          controller: password,
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                passwordFillColor = AppColors.textFieldFocusColor;
                passwordBorderSideColor = AppColors.mainColor;
              } else {
                passwordFillColor = AppColors.textFieldFillColor;
                passwordBorderSideColor = Colors.transparent;
              }
            });
          },
          fillColor: passwordFillColor,
          borderSideColor: passwordBorderSideColor),
      TextFieldModel(
          hintText: 'Confirm Password',
          prefixIcon: Icons.password,
          obscureText: true,
          controller: confirmPassword,
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                confirmPasswordFillColor = AppColors.textFieldFocusColor;
                confirmPasswordBorderSideColor = AppColors.mainColor;
              } else {
                confirmPasswordFillColor = AppColors.textFieldFillColor;
                confirmPasswordBorderSideColor = Colors.transparent;
              }
            });
          },
          fillColor: confirmPasswordFillColor,
          borderSideColor: confirmPasswordBorderSideColor)
    ];

    return AuthListView(items: items);
  }
}
