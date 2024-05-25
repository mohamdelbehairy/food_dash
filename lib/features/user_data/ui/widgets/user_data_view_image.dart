import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_images.dart';
import 'package:food_dash/features/image/logic/pick_image/pick_image_cubit.dart';

class UserDataViewCustomImage extends StatelessWidget {
  const UserDataViewCustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    var pickImage = context.read<PickImageCubit>().image;
    return CircleAvatar(
        radius: 70,
        backgroundColor: Colors.transparent,
        backgroundImage: pickImage.path.isNotEmpty
            ? FileImage(File(pickImage.path)) as ImageProvider
            : AssetImage(Assets.imagesUserDataViewAsset));
  }
}
