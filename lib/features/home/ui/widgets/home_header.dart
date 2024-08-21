import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/logic/get_user_data/get_user_data_cubit.dart';
import 'custom_profile_image.dart';
import 'profile_headers_icons.dart';
import 'profile_location_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.user.isNotEmpty) {
          final userData = state.user.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CustomProfileImage(userData: userData),
                  SizedBox(width: 10),
                  ProfileLocationWidget(),
                ]),
                ProfileHeaderIcons()
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

