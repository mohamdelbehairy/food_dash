import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

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
      required this.isLoading,
      this.onChangedPhoneNumber, required this.isValue});
  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final bool isLoading,isValue;
  final Function(PhoneNumber)? onChangedPhoneNumber;

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
        if (FirebaseAuth.instance.currentUser!.phoneNumber == null)
          const SizedBox(height: 20),
        if (FirebaseAuth.instance.currentUser!.phoneNumber == null)
          UserDataPhoneNumberTextField(
              onChangedPhoneNumber: onChangedPhoneNumber,
              isValue: isValue,
              size: size,
              phoneNumber: phoneNumber,
              isLoading: isLoading),
        if (FirebaseAuth.instance.currentUser!.email == null)
          const SizedBox(height: 20),
        if (FirebaseAuth.instance.currentUser!.email == null)
          EmailTextField(email: email, isLoading: isLoading),
        const SizedBox(height: 20),
        GenderTextField(gender: gender, size: size, isLoading: isLoading),
      ],
    );
  }
}
