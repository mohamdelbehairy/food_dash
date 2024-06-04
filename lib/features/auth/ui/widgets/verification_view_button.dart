import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_dash/features/auth/logic/auth_setting/auth_settings_cubit.dart';

import '../../../../core/models/awsome_dialog_model.dart';
import '../../../../core/utils/custom_awsome_dialog.dart';
import '../../../../core/utils/widgets/custom_button_item.dart';

class VerificationViewButton extends StatelessWidget {
  const VerificationViewButton({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) {
        if (state is SendEmailVerificationSuccess) {
          customAwsomeDialog(
              awsomeDialogModel: AwsomeDialogModel(
                  context: context,
                  autoHide: const Duration(seconds: 4),
                  horizontal: 12,
                  title: 'Verification email sent',
                  desc:
                      'Verification link sent successful, Please check your email.',
                  dialogType: DialogType.success));
        }
      },
      child: CustomButtonItem(
          width: size.width * .8,
          size: size,
          buttonName: 'Resend Verification Email',
          onTap: () async {
            await context.read<AuthSettingsCubit>().sendEmailVerification();
          }),
    );
  }
}
