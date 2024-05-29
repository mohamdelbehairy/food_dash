import 'package:flutter/material.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
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
      required this.gender,
      required this.isLoading});
  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullNameTextField(fullName: fullName, isLoading: isLoading),
        const SizedBox(height: 20),
        CustomTextField(
            textFieldModel: TextFieldModel(
                controller: nickName,
                hintText: 'Nickname',
                enabled: !isLoading)),
        const SizedBox(height: 20),
        DateOfBirthTextField(dateOfBirth: dateOfBirth, isLoading: isLoading),
        const SizedBox(height: 20),
        UserDataPhoneNumberTextField(
            size: size, phoneNumber: phoneNumber, isLoading: isLoading),
        const SizedBox(height: 20),
        EmailTextField(email: email, isLoading: isLoading),
        const SizedBox(height: 20),
        GenderTextField(gender: gender, size: size, isLoading: isLoading),
      ],
    );
  }
}
