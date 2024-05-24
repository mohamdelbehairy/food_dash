import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/pick_image/logic/pick_image/pick_image_cubit.dart';

import '../../../../core/utils/components/custom_button_item.dart';

class UserDataViewButton extends StatelessWidget {
  const UserDataViewButton(
      {super.key,
      required this.size,
      required this.fullName,
      required this.nickName,
      required this.dateOfBirth,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.globalKey});

  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    var image = context.read<PickImageCubit>().image;
    return CustomButtonItem(
        size: size,
        buttonName: 'Continue',
        onTap: () {
          if (globalKey.currentState!.validate()) {
            globalKey.currentState!.save();
            debugPrint('image: ${image.path}');
            debugPrint('fullName: ${fullName.text}');
            debugPrint('nickName: ${nickName.text}');
            debugPrint('dateOfBirth: ${dateOfBirth.text}');
            debugPrint('email: ${email.text}');
            debugPrint('phoneNumber: ${phoneNumber.text}');
            debugPrint('gender: ${gender.text}');
          }
        });
  }
}
