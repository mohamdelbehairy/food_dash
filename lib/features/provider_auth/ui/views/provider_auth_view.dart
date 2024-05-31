import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_colors.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/logic/is_user_data/is_user_data_cubit.dart';
import '../../../auth/logic/google_auth/google_auth_cubit.dart';
import '../../../user_data/logic/store_user_data/store_user_data_cubit.dart';
import '../widgets/provider_auth_view_body.dart';

class ProviderAuthView extends StatelessWidget {
  const ProviderAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var storeUserData = context.read<StoreUserDataCubit>();
    var isUserData = context.read<IsUserDataCubit>();
    var isLoading = context.read<GoogleAuthCubit>();

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
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).push(AppRouter.homeView);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: isLoading.isLoading,
            offset: Offset(size.width * 0.45, size.height * .55),
            progressIndicator:
                CircularProgressIndicator(color: AppColors.mainColor),
            opacity: 0.2,
            color: AppColors.mainColor,
            child: Scaffold(
                appBar: AppBar(), body: ProviderAuthViewBody(size: size)));
      },
    );
  }
}
