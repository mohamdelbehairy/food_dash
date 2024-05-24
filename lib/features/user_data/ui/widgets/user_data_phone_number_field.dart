import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_colors.dart';

import '../../../../core/models/text_field_model.dart';
import 'phone_number_text_field.dart';

class UserDataPhoneNumberTextField extends StatefulWidget {
  const UserDataPhoneNumberTextField(
      {super.key, required this.size, required this.phoneNumber});

  final Size size;
  final TextEditingController phoneNumber;

  @override
  State<UserDataPhoneNumberTextField> createState() =>
      _UserDataPhoneNumberTextFieldState();
}

class _UserDataPhoneNumberTextFieldState
    extends State<UserDataPhoneNumberTextField> {
  bool isValue = false;
  @override
  Widget build(BuildContext context) {
    return PhoneNumberTextField(
        size: widget.size,
        textFieldModel: TextFieldModel(
            keyboardType: TextInputType.emailAddress,
            controller: widget.phoneNumber,
            hintText: '000 000 000',
            suffixIconColor:
                isValue ? Colors.black : AppColors.textFieldHintColor,
            onChangedPhoneNumber: (phoneNumber) {
              setState(() {
                isValue = phoneNumber.number.isNotEmpty;
              });

              debugPrint(phoneNumber.completeNumber);
            }));
  }
}
