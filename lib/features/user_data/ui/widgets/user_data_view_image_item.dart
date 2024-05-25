import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../image/logic/pick_image/pick_image_cubit.dart';
import 'user_data_view_icon_image.dart';
import 'user_data_view_image.dart';

class UserDataViewImageItem extends StatelessWidget {
  const UserDataViewImageItem({super.key, required this.isLoading});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var pickImage = context.read<PickImageCubit>();

    return BlocConsumer<PickImageCubit, PickImageState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 16, bottom: 24),
          child: Stack(
            children: [
              UserDataViewCustomImage(),
              UserDataViewIconImage(pickImage: pickImage, isLoading: isLoading),
            ],
          ),
        );
      },
    );
  }
}
