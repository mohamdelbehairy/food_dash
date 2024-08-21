import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/ui/widgets/app_bar_auth.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/models/modal_progress_model.dart';
import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
import '../../../../core/utils/logic/user_data_setting/user_data_setting_cubit.dart';
import '../../../../core/utils/widgets/custom_modal_progress_hud.dart';
import '../../../user_data/logic/store_user_data/store_user_data_cubit.dart';
import '../../logic/google_auth/google_auth_cubit.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import 'login_view_details.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody(
      {super.key,
      required this.isUserData,
      required this.storeUserData,
      required this.isLoading,
      required this.setSharedPref,
      required this.size});

  final UserDataSettingCubit isUserData;
  final StoreUserDataCubit storeUserData;
  final GoogleAuthCubit isLoading;
  final SharedPrefCubit setSharedPref;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isClick = context.read<RememberMeCubit>();
    return BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) async {
        if (state is GoogleAuthSuccess && state.isLoading) {
          if (!await isUserData.isUserData()) {
            await storeUserData.storeUserData(
                profileImage: state.user.photoURL!,
                fullName: state.user.displayName!,
                email: state.user.email!,
                phoneNumber: state.user.phoneNumber);
          }
          isLoading.isLoading = state.isLoading;
          await setSharedPref.setSharedPref(
              key: Constants.useAppFirstTime, value: 'done');
          await setSharedPref.setSharedPref(
              key: Constants.isGoogleAuth, value: 'google');
        }
      },
      builder: (context, state) {
        return CustomModalprogressHUD(
          modalProgressModel: ModalProgressModel(
              inAsyncCall: isLoading.isLoading,
              offset: Offset(size.width * 0.45, size.height * .55),
              opacity: 0.2,
              progressIndicatorColor: AppColors.mainColor,
              modalprogressColor: AppColors.mainColor,
              child: Scaffold(
                  appBar: authAppBar(context, isClick),
                  body: LoginViewDetails(size: size))),
        );
      },
    );
  }
}
