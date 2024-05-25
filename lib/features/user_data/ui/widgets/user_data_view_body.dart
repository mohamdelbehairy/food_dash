import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/image/logic/upload_image/upload_image_cubit.dart';
import 'package:food_dash/features/user_data/logic/store_user_data/store_user_data_cubit.dart';
import 'user_data_view_section.dart';

class UserDataViewBody extends StatelessWidget {
  const UserDataViewBody({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    var uploadImage = context.read<UploadImageCubit>().isLoading;
    var storeUserData = context.read<StoreUserDataCubit>().isLoading;

    return BlocConsumer<StoreUserDataCubit, StoreUserDataState>(
      listener: (context, storeState) {
        if (storeState is StoreUserDataLoading) {
          storeUserData = storeState.isLoading;
        }
      },
      builder: (context, storeState) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, uploadState) {
            if (uploadState is UploadImageLoading) {
              uploadImage = uploadState.isLoading;
            }
          },
          builder: (context, uploadState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: UserDataViewSection(
                    size: size,
                    isLoading:
                        uploadImage == true ? uploadImage : storeUserData),
              ),
            );
          },
        );
      },
    );
  }
}
