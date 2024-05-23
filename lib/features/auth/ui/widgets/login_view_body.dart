import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';
import 'package:food_dash/features/auth/ui/widgets/login_view_section.dart';

import '../../../../core/utils/custom_snack_bar_item.dart';

class LoginvViewBody extends StatelessWidget {
  const LoginvViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailLoginCubit, EmailLoginState>(
      listener: (context, state) {
        if (state is EmailLoginSuccess) {
          debugPrint('تسجيل دخول ناجح');
        }
        // if (state is EmailRegisterLoading) {
        //   isLoading = state.isLoading;
        // }
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
              child: LoginViewSection(size: size)),
        );
      },
    );
  }
}
