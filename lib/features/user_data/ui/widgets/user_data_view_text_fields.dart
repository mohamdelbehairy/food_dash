import 'package:flutter/material.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/components/custom_text_field.dart';
import 'date_of_birth_text_field.dart';
import 'email_text_field.dart';
import 'full_name_text_field.dart';
import 'gender_text_field.dart';
import 'user_data_phone_number_field.dart';

class UserDataViewTextFields extends StatelessWidget {
  const UserDataViewTextFields(
      {super.key,
      required this.size,
      required this.fullName,
      required this.nickName,
      required this.dateOfBirth,
      required this.email,
      required this.phoneNumber,
      required this.gender});
  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullNameTextField(fullName: fullName),
        const SizedBox(height: 20),
        CustomTextField(
            textFieldModel:
                TextFieldModel(controller: nickName, hintText: 'Nickname')),
        const SizedBox(height: 20),
        DateOfBirthTextField(dateOfBirth: dateOfBirth),
        const SizedBox(height: 20),
        UserDataPhoneNumberTextField(size: size, phoneNumber: phoneNumber),
        const SizedBox(height: 20),
        EmailTextField(email: email),
        const SizedBox(height: 20),
        GenderTextField(gender: gender),
      ],
    );
  }
}

