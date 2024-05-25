import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/image/logic/pick_image/pick_image_cubit.dart';

import 'user_data_view_component_details.dart';

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
    var pickImage = context.read<PickImageCubit>();
    return BlocConsumer<PickImageCubit, PickImageState>(
        listener: (context, state) {
      if (state is PickImageSuccess) {
        pickImage.image = state.image;
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return UserDataViewComponentDetails(
          isLoading: isLoading,
          pickImage: pickImage,
          size: size,
          fullName: fullName,
          nickName: nickName,
          dateOfBirth: dateOfBirth,
          email: email,
          phoneNumber: phoneNumber,
          gender: gender,
          globalKey: globalKey);
    });
  }
}
