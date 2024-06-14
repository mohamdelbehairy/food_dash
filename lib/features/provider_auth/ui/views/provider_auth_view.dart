import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/models/modal_progress_model.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/widgets/custom_modal_progress_hud.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/utils/logic/user_data_setting/user_data_setting_cubit.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
import '../../../auth/logic/google_auth/google_auth_cubit.dart';
import '../../../user_data/logic/store_user_data/store_user_data_cubit.dart';
import '../widgets/provider_auth_view_body.dart';

class ProviderAuthView extends StatelessWidget {
  const ProviderAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var storeUserData = context.read<StoreUserDataCubit>();
    var isUserData = context.read<UserDataSettingCubit>();
    var isLoading = context.read<GoogleAuthCubit>();
    var setSharedPref = context.read<SharedPrefCubit>();

    return BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) async {
        if (state is GoogleAuthSuccess && state.isLoading) {
          if (!await isUserData.isUserData()) {
            await storeUserData.storeUserData(
                profileImage: state.user.photoURL!,
                fullName: state.user.displayName!,
                email: state.user.email!,
                phoneNumber: state.user.phoneNumber,
                isGoogleAuth: true);
          }
          isLoading.isLoading = state.isLoading;
          Future.delayed(const Duration(seconds: 2), () async {
            await setSharedPref.setSharedPref(
                key: Constants.useAppFirstTime, value: 'done');
            GoRouter.of(context).push(AppRouter.homeView);
          });
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
                    appBar: AppBar(), body: ProviderAuthViewBody(size: size))));
      },
    );
  }
}
