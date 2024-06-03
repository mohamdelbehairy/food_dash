import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class TextFieldModel {
  final String hintText;
  final IconData? prefixIcon, suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText, enabled;
  final Color? fillColor, borderSideColor, suffixIconColor;
  final Function(String)? onChanged;
  final double? suffizyIconSize;
  String? Function(String?)? validator;
  final Function()? suffixIconFunction;
  final Function(PhoneNumber)? onChangedPhoneNumber;
  FutureOr<String?> Function(PhoneNumber?)? phoneNumberValidator;

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
      this.suffizyIconSize,
      this.validator,
      this.suffixIconFunction,
      this.suffixIconColor,
      this.onChangedPhoneNumber,
      this.phoneNumberValidator});
}
