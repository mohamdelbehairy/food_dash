import 'package:flutter/material.dart';

class TextFieldModel {
  final String hintText;
  final IconData? prefixIcon, suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText, enabled;
  final Color? fillColor, borderSideColor;
  final Function(String)? onChanged;
  final double? suffizyIconSize;

  TextFieldModel(
      {required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.keyboardType,
      this.obscureText,
      this.enabled,
      this.fillColor,
      this.onChanged,
      this.borderSideColor,
      this.suffizyIconSize});
}
