import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/models/text_field_model.dart';
import 'phone_number_text_field.dart';

class UserDataPhoneNumberTextField extends StatelessWidget {
  const UserDataPhoneNumberTextField(
      {super.key,
      required this.size,
      required this.phoneNumber,
      required this.isLoading,
      required this.isValue,
      this.onChangedPhoneNumber});

  final Size size;
  final TextEditingController phoneNumber;
  final bool isLoading, isValue;
  final Function(PhoneNumber)? onChangedPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return PhoneNumberTextField(
        size: size,
        isLoading: isLoading,
        textFieldModel: TextFieldModel(
          keyboardType: TextInputType.emailAddress,
          controller: phoneNumber,
          hintText: '000 000 000',
          suffixIconColor:
              isValue ? Colors.black : AppColors.textFieldHintColor,
          onChangedPhoneNumber: onChangedPhoneNumber,
        ));
  }
}
