import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';

import 'register_view_body_component.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<EmailRegisterCubit>().isLoading;
    return BlocConsumer<EmailRegisterCubit, EmailRegisterState>(
      listener: (context, state) {
        if (state is EmailRegisterSuccess) {
          debugPrint('تسجيل دخول ناجح');
        }
        if (state is EmailRegisterLoading) {
          isLoading = state.isLoading;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: RegisterViewBodyComponent(size: size, isLoading: isLoading),
          ),
        );
      },
    );
  }
}
