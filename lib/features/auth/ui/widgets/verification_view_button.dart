import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/custom_snack_bar_item.dart';
import 'package:food_dash/features/auth/logic/auth_setting/auth_settings_cubit.dart';

import '../../../../core/utils/components/custom_button_item.dart';

class VerificationViewButton extends StatelessWidget {
  const VerificationViewButton({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) {
        if (state is SendEmailVerificationSuccess) {
          customSnackBarItem(
              context,
              Text(
                  'Verification link sent successful, Please check your email.'));
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
