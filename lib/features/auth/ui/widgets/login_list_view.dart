import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';

import '../../../../core/models/text_field_model.dart';
import 'auth_list_view.dart';

class LoginListView extends StatefulWidget {
  const LoginListView(
      {super.key,
      required this.email,
      required this.password,
      required this.isLoading});
  final TextEditingController email;
  final TextEditingController password;
  final bool isLoading;

  @override
  State<LoginListView> createState() => _LoginListViewState();
}

class _LoginListViewState extends State<LoginListView> {
  Color? emailFillColor;
  Color? passwordFillColor;
  Color? emailBorderSideColor;
  Color? passwordBorderSideColor;

  bool isPasswordVisable = true;

  @override
  Widget build(BuildContext context) {
    List<TextFieldModel> items = loginTextFieldDetails();

    return AuthListView(items: items);
  }

  List<TextFieldModel> loginTextFieldDetails() {
    List<TextFieldModel> items = [
      TextFieldModel(
          enabled: !widget.isLoading,
          hintText: 'Email',
          prefixIcon: FontAwesomeIcons.solidEnvelope,
          keyboardType: TextInputType.emailAddress,
          controller: widget.email,
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
          borderSideColor: emailBorderSideColor,
          validator: (value) {
            if (value!.isEmpty) {
              return 'email is required';
            }
            if (!EmailValidator.validate(value)) {
              return 'please enter a valid email';
            }
            return null;
          }),
      TextFieldModel(
          enabled: !widget.isLoading,
          hintText: 'Password',
          prefixIcon: Icons.password,
          obscureText: isPasswordVisable,
          controller: widget.password,
          suffixIcon:
              isPasswordVisable ? Icons.visibility_off : Icons.visibility,
          suffizyIconSize: 20,
          suffixIconFunction: () {
            setState(() {
              isPasswordVisable = !isPasswordVisable;
            });
          },
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
          borderSideColor: passwordBorderSideColor,
          validator: (value) {
            if (value!.isEmpty && EmailValidator.validate(widget.email.text)) {
              return 'password is required';
            }
            if (value.length < 8 &&
                EmailValidator.validate(widget.email.text)) {
              return 'password must be at least 8 characters';
            }
            return null;
          }),
    ];

    return items;
  }
}
