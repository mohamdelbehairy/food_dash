import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_colors.dart';

import '../../../../core/utils/app_styles.dart';
import '../models/auth_text_field_model.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.authTextFieldModel});
  final AuthTextFieldModel authTextFieldModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        onChanged: authTextFieldModel.onChanged,
        keyboardType: authTextFieldModel.keyboardType ?? TextInputType.text,
        controller: authTextFieldModel.controller,
        obscureText: authTextFieldModel.obscureText ?? false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: authTextFieldModel.borderSideColor ??
                        Colors.transparent)),
            filled: true,
            fillColor: authTextFieldModel.fillColor  ?? const Color(0xfffafbfb),
            prefixIcon: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(authTextFieldModel.prefixIcon,
                    color: Color(0xff9d9c9d), size: 14)),
            hintText: authTextFieldModel.hintText,
            hintStyle: AppStyles.styleReqular14
                .copyWith(color: AppColors.textFieldHintColor)),
      ),
    );
  }
}
