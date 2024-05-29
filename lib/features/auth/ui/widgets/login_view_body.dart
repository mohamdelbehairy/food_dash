import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/logic/is_user_data/is_user_data_cubit.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';
import 'package:food_dash/features/auth/ui/widgets/login_view_section.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/custom_snack_bar_item.dart';

class LoginvViewBody extends StatelessWidget {
  const LoginvViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<EmailLoginCubit>().isLoading;
    var isUserData = context.read<IsUserDataCubit>().isUserData();

    return BlocConsumer<EmailLoginCubit, EmailLoginState>(
      listener: (context, state) async {
        if (state is EmailLoginSuccess) {
          if (await isUserData && FirebaseAuth.instance.currentUser!.emailVerified) {
            debugPrint('تسجيل دخول ناجح');
          } else {
            if (!FirebaseAuth.instance.currentUser!.emailVerified && await isUserData) {
              customSnackBarItem(
                  context,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('email not verified'),
                      IconButton(
                          onPressed: () => GoRouter.of(context)
                              .go(AppRouter.verificationView),
                          icon: Icon(Icons.verified, color: Colors.white))
                    ],
                  ));
            }
            if (!await isUserData) {
              customSnackBarItem(
                  context,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('add user data first after login'),
                      IconButton(
                          onPressed: () =>
                              GoRouter.of(context).go(AppRouter.userDataView),
                          icon: Icon(Icons.person_add_alt_1_sharp,
                              color: Colors.white))
                    ],
                  ));
            }
          }
        }
        if (state is EmailLoginLoading) {
          isLoading = state.isLoading;
        }
        if (state is EmailLoginFailure &&
            state.errorMessage == 'invalid-credential') {
          customSnackBarItem(context, Text('invalid-credential'));
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
