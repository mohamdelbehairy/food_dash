import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/models/text_field_model.dart';
import 'auth_list_view.dart';

class RegisterListView extends StatefulWidget {
  const RegisterListView(
      {super.key,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.isLoading});
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final bool isLoading;

  @override
  State<RegisterListView> createState() => _RegisterListViewState();
}

class _RegisterListViewState extends State<RegisterListView> {
  Color? emailFillColor;
  Color? passwordFillColor;
  Color? confirmPasswordFillColor;
  Color? emailBorderSideColor;
  Color? passwordBorderSideColor;
  Color? confirmPasswordBorderSideColor;

  bool isPasswordVisable = true;
  bool isConfirmPasswordVisable = true;

  @override
  Widget build(BuildContext context) {
    List<TextFieldModel> items = registrTextFieldDetails();

    return AuthListView(items: items);
  }

  List<TextFieldModel> registrTextFieldDetails() {
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
        suffixIcon: isPasswordVisable ? Icons.visibility_off : Icons.visibility,
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
          if (value.length < 8 && EmailValidator.validate(widget.email.text)) {
            return 'password must be at least 8 characters';
          }
          if (value != widget.confirmPassword.text &&
              widget.confirmPassword.text.length >= 8 &&
              EmailValidator.validate(widget.email.text)) {
            return 'passwords do not match';
          }
          return null;
        },
      ),
      TextFieldModel(
          enabled: !widget.isLoading,
          hintText: 'Confirm Password',
          prefixIcon: Icons.password,
          obscureText: isConfirmPasswordVisable,
          controller: widget.confirmPassword,
          suffixIcon: isConfirmPasswordVisable
              ? Icons.visibility_off
              : Icons.visibility,
          suffizyIconSize: 20,
          suffixIconFunction: () {
            setState(() {
              isConfirmPasswordVisable = !isConfirmPasswordVisable;
            });
          },
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
          borderSideColor: confirmPasswordBorderSideColor,
          validator: (value) {
            if (value!.isEmpty &&
                EmailValidator.validate(widget.email.text) &&
                widget.password.text.length >= 8) {
              return 'confirm password is required';
            }
            if (value.length < 8 &&
                EmailValidator.validate(widget.email.text) &&
                widget.password.text.length >= 8) {
              return 'password must be at least 8 characters';
            }
            if (value != widget.password.text &&
                EmailValidator.validate(widget.email.text) &&
                widget.password.text.length >= 8) {
              return 'passwords do not match';
            }
            return null;
          }),
    ];
    return items;
  }
}
