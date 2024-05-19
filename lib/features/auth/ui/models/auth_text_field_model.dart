import 'package:flutter/material.dart';

class AuthTextFieldModel {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText;

  AuthTextFieldModel(
      {required this.hintText,
      required this.prefixIcon,
      required this.controller,
      this.keyboardType,
      this.obscureText});
}
