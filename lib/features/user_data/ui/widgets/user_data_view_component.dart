import 'package:flutter/material.dart';

import 'user_data_view_button.dart';
import 'user_data_view_image_item.dart';
import 'user_data_view_text_fields.dart';

class UserDataViewComponenet extends StatelessWidget {
  const UserDataViewComponenet(
      {super.key,
      required this.size,
      required this.fullName,
      required this.nickName,
      required this.dateOfBirth,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.globalKey,
      required this.isLoading});

  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final GlobalKey<FormState> globalKey;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDataViewImageItem(isLoading: isLoading),
        UserDataViewTextFields(
            isLoading: isLoading,
            size: size,
            fullName: fullName,
            nickName: nickName,
            dateOfBirth: dateOfBirth,
            email: email,
            phoneNumber: phoneNumber,
            gender: gender),
        const SizedBox(height: 32),
        UserDataViewButton(
            isLoading: isLoading,
            size: size,
            fullName: fullName,
            nickName: nickName,
            dateOfBirth: dateOfBirth,
            email: email,
            phoneNumber: phoneNumber,
            gender: gender,
            globalKey: globalKey),
        const SizedBox(height: 24),
      ],
    );
  }
}
