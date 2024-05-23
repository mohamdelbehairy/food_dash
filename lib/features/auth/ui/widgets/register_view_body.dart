import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';

import '../../../../core/utils/custom_snack_bar_item.dart';
import 'register_view_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<EmailRegisterCubit>().isLoading;
    return BlocConsumer<EmailRegisterCubit, EmailRegisterState>(
      listener: (context, state) {
        if (state is EmailRegisterSuccess) {
          debugPrint('تسجيل دخول جديد ناجح');
        }
        if (state is EmailRegisterLoading) {
          isLoading = state.isLoading;
        }
        if (state is EmailRegisterFailure &&
            state.errorMessage == 'weak-password') {
          customSnackBarItem(context, Text('weak-password'));
        }
        if (state is EmailRegisterFailure &&
            state.errorMessage == 'email-already-in-use') {
          customSnackBarItem(context, Text('email-already-in-use'));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: RegisterViewSection(size: size, isLoading: isLoading),
          ),
        );
      },
    );
  }
}
