import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/image/logic/upload_image/upload_image_cubit.dart';
import 'user_data_view_section.dart';

class UserDataViewBody extends StatelessWidget {
  const UserDataViewBody({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    var uploadImage = context.read<UploadImageCubit>().isLoading;
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImageLoading) {
          uploadImage = state.isLoading;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: UserDataViewSection(size: size,isLoading: uploadImage),
          ),
        );
      },
    );
  }
}
