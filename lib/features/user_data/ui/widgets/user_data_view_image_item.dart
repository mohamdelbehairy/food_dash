import 'package:flutter/material.dart';

import '../../../image/logic/pick_image/pick_image_cubit.dart';
import 'user_data_view_icon_image.dart';
import 'user_data_view_image.dart';

class UserDataViewImageItem extends StatelessWidget {
  const UserDataViewImageItem(
      {super.key, required this.isLoading, required this.pickImage});
  final bool isLoading;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 24),
      child: Stack(
        children: [
          UserDataViewCustomImage(),
          UserDataViewIconImage(pickImage: pickImage, isLoading: isLoading),
        ],
      ),
    );
  }
}
