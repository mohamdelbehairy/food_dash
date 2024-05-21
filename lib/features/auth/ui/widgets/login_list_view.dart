import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dash/core/utils/app_colors.dart';

import '../../../../core/models/text_field_model.dart';
import 'auth_list_view.dart';

class LoginListView extends StatefulWidget {
  const LoginListView({super.key});

  @override
  State<LoginListView> createState() => _LoginListViewState();
}

class _LoginListViewState extends State<LoginListView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Color? emailFillColor;
  Color? passwordFillColor;
  Color? emailBorderSideColor;
  Color? passwordBorderSideColor;

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
    ];
    return AuthListView(items: items);
  }
}
