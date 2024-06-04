import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/models/awsome_dialog_model.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/custom_awsome_dialog.dart';
import 'register_view_section.dart';

class RegisterViewDetails extends StatelessWidget {
  const RegisterViewDetails({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<EmailRegisterCubit>().isLoading;
    return BlocConsumer<EmailRegisterCubit, EmailRegisterState>(
      listener: (context, state) {
        if (state is EmailRegisterSuccess) {
          GoRouter.of(context).go(AppRouter.userDataView);
        }
        if (state is EmailRegisterLoading) {
          isLoading = state.isLoading;
        }
        if (state is EmailRegisterFailure &&
            state.errorMessage == 'weak-password') {
          customAwsomeDialog(
              awsomeDialogModel: AwsomeDialogModel(
                  context: context,
                  autoHide: const Duration(seconds: 3),
                  title: 'Ops, The password provided is too weak.',
                  // desc: 'Ops, The password provided is too weak.',
                  dialogType: DialogType.error));
        }
        if (state is EmailRegisterFailure &&
            state.errorMessage == 'email-already-in-use') {
          customAwsomeDialog(
              awsomeDialogModel: AwsomeDialogModel(
                  context: context,
                  // autoHide: const Duration(seconds: 3),
                  title: 'Email already in use',
                  horizontal: 16,
                  desc: 'Ops, The account already exists for that email.',
                  dialogType: DialogType.error));
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
