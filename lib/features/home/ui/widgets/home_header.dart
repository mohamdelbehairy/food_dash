import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/auth/logic/user_profile/user_profile_cubit.dart';
import 'package:food_dash/features/auth/logic/user_profile/user_profile_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserProfileCubit()..getUserProfile(Constants.userField),
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          var userDataCubit = context.read<UserProfileCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    
                    CircleAvatar(
                      foregroundImage: (userDataCubit.userModel?.profileImage ==
                                  null ||
                              userDataCubit.userModel?.profileImage == '')
                          ? NetworkImage(Constants.userDataViewImageUrl)
                              as ImageProvider<Object>
                          : NetworkImage(
                                  '${userDataCubit.userModel?.profileImage}')
                              as ImageProvider<Object>,

                      radius: 22,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deliver to',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Times Square',
                              style: AppStyles.styleSemiBold16
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.mainColor,
                              size: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: 26,
                            ),
                            Positioned(
                                right: 4,
                                top: 4,
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 5,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    InkWell(
                      onTap: () => AppRouter.router.go(AppRouter.cart),
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.shopping_bag_rounded,
                                color: Colors.black,
                                size: 26,
                              ),
                              Positioned(
                                  right: 4,
                                  top: 4,
                                  child: Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                    size: 5,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
