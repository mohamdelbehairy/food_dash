import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_colors.dart';

import '../app_styles.dart';
import '../../models/text_field_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        validator: textFieldModel.validator,
        enabled: textFieldModel.enabled ?? true,
        onChanged: textFieldModel.onChanged,
        keyboardType: textFieldModel.keyboardType ?? TextInputType.text,
        controller: textFieldModel.controller,
        obscureText: textFieldModel.obscureText ?? false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: textFieldModel.prefixIcon != null ? 16 : 8,
                horizontal: textFieldModel.prefixIcon == null ? 16 : 0),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color:
                        textFieldModel.borderSideColor ?? Colors.transparent)),
            filled: true,
            fillColor: textFieldModel.fillColor ?? const Color(0xfffafbfb),
            prefixIcon: textFieldModel.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(textFieldModel.prefixIcon,
                        color: AppColors.textFieldHintColor, size: 14))
                : null,
            suffixIcon: textFieldModel.suffixIcon != null
                ? GestureDetector(
                    onTap: textFieldModel.suffixIconFunction,
                    child: Icon(
                      textFieldModel.suffixIcon,
                      size: textFieldModel.suffizyIconSize ?? 14,
                      color: textFieldModel.suffixIconColor ??
                          AppColors.textFieldHintColor,
                    ),
                  )
                : null,
            hintText: textFieldModel.hintText,
            hintStyle: AppStyles.styleReqular14
                .copyWith(color: AppColors.textFieldHintColor)),
      ),
    );
  }
}
