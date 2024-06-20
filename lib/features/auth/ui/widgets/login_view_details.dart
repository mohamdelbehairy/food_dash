import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/core/utils/logic/user_data_setting/user_data_setting_cubit.dart';
import 'package:food_dash/core/utils/logic/shared_pref/shared_pref_cubit.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';
import 'package:food_dash/features/auth/ui/widgets/login_view_section.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/awsome_dialog_model.dart';
import '../../../../core/utils/app_details/app_router.dart';
import '../../../../core/utils/app_details/custom_awsome_dialog.dart';

class LoginViewDetails extends StatelessWidget {
  const LoginViewDetails({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<EmailLoginCubit>().isLoading;
    var isUserData = context.read<UserDataSettingCubit>().isUserData();
    var setSharedPref = context.read<SharedPrefCubit>();

    return BlocConsumer<EmailLoginCubit, EmailLoginState>(
      listener: (context, state) async {
        if (state is EmailLoginSuccess) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            await setSharedPref.setSharedPref(
                key: Constants.useAppFirstTime, value: 'done');
            await setSharedPref.setSharedPref(
                key: Constants.isEmailAuth, value: 'email');
            GoRouter.of(context).go(AppRouter.homeView);
          } else {
            if (!FirebaseAuth.instance.currentUser!.emailVerified &&
                await isUserData) {
              customAwsomeDialog(
                  awsomeDialogModel: AwsomeDialogModel(
                      context: context,
                      showCloseIcon: true,
                      title: 'Email is not verified',
                      desc: 'Please verified you email and login again.',
                      dialogType: DialogType.error,
                      btnCancelText: 'Verified now',
                      btnCancelOnPress: () =>
                          GoRouter.of(context).go(AppRouter.verificationView)));
            }
          }
        }
        if (state is EmailLoginLoading) {
          isLoading = state.isLoading;
        }
        if (state is EmailLoginFailure &&
            state.errorMessage == 'invalid-credential') {
          customAwsomeDialog(
              awsomeDialogModel: AwsomeDialogModel(
                  context: context,
                  autoHide: const Duration(seconds: 4),
                  horizontal: 16,
                  title: 'Login Failed',
                  desc:
                      'Opps, There was a problem logging in. Check your email and password or create an account.',
                  dialogType: DialogType.error));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: LoginViewSection(
                  size: size, isLoading: isLoading, isUserData: isUserData)),
        );
      },
    );
  }
}
