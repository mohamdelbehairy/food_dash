import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/image/logic/upload_image/upload_image_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/utils/components/custom_button_item.dart';
import '../../logic/store_user_data/store_user_data_cubit.dart';

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
      required this.globalKey,
      required this.isLoading,
      required this.image});

  final Size size;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final GlobalKey<FormState> globalKey;
  final bool isLoading;
  final File image;

  @override
  Widget build(BuildContext context) {
    var uploadImage = context.read<UploadImageCubit>();
    var storeUserData = context.read<StoreUserDataCubit>();

    return CustomButtonItem(
        size: size,
        isLoading: isLoading,
        buttonName: 'Continue',
        onTap: () async {
          if (globalKey.currentState!.validate()) {
            globalKey.currentState!.save();
            debugPrint('path: ${image.path}');
            String imageUrl = '';
            if (image.path.isNotEmpty) {
              debugPrint('path: ${image.path}');
              imageUrl = await uploadImage.uploadImage(imageFile: image);
            }

            await storeUserData.storeUserData(
                profileImage: imageUrl.isNotEmpty
                    ? imageUrl
                    : Constants.userDataViewImageUrl,
                fullName: fullName.text,
                nickName: nickName.text,
                dateOfBirth: dateOfBirth.text,
                email: email.text.isNotEmpty
                    ? email.text
                    : Constants.currentUser.email!,
                phoneNumber: phoneNumber.text,
                gender: gender.text);
          }
        });
  }
}