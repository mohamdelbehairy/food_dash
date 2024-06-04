import 'package:flutter/material.dart';

import '../../../image/logic/pick_image/pick_image_cubit.dart';
import 'user_data_view_button.dart';
import 'user_data_view_image_item.dart';
import 'user_data_view_text_fields.dart';

class UserDataViewComponentDetails extends StatefulWidget {
  const UserDataViewComponentDetails(
      {super.key,
      required this.isLoading,
      required this.pickImage,
      required this.size,
      required this.fullName,
      required this.nickName,
      required this.dateOfBirth,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.globalKey});

  final bool isLoading;
  final PickImageCubit pickImage;
  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final GlobalKey<FormState> globalKey;

  @override
  State<UserDataViewComponentDetails> createState() =>
      _UserDataViewComponentDetailsState();
}

class _UserDataViewComponentDetailsState
    extends State<UserDataViewComponentDetails> {
  bool isValue = false;
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserDataViewImageItem(
            isLoading: widget.isLoading, pickImage: widget.pickImage),
        UserDataViewTextFields(
          isValue: isValue,
          isLoading: widget.isLoading,
          size: widget.size,
          fullName: widget.fullName,
          nickName: widget.nickName,
          dateOfBirth: widget.dateOfBirth,
          email: widget.email,
          phoneNumber: widget.phoneNumber,
          gender: widget.gender,
          onChangedPhoneNumber: (phoneNumber) {
            setState(() {
              isValue = phoneNumber.number.isNotEmpty;
            });
            number = phoneNumber.completeNumber;
          },
        ),
        const SizedBox(height: 32),
        UserDataViewButton(
            number: number,
            image: widget.pickImage.image,
            isLoading: widget.isLoading,
            size: widget.size,
            fullName: widget.fullName,
            nickName: widget.nickName,
            dateOfBirth: widget.dateOfBirth,
            email: widget.email,
            phoneNumber: widget.phoneNumber,
            gender: widget.gender,
            globalKey: widget.globalKey),
        const SizedBox(height: 24),
      ],
    );
  }
}
