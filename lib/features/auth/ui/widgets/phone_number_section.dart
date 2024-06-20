import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/models/awsome_dialog_model.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/auth/logic/phone_number/phone_number_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/utils/app_details/custom_awsome_dialog.dart';
import 'phone_number_component.dart';

class PhoneNumberSection extends StatelessWidget {
  const PhoneNumberSection(
      {super.key,
      required this.size,
      required this.isValue,
      required this.controller,
      this.onChangedPhoneNumber,
      required this.number,
      required this.text});

  final Size size;
  final bool isValue;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChangedPhoneNumber;

  final String number, text;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<PhoneNumberCubit>();

    return BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
      listener: (context, state) async {
        if (state is SendCodeLoading) {
          isLoading.isLoading = state.isLoading;
          debugPrint('isLoading: ${isLoading.isLoading}');
        }
        if (state is SendCodeSuccess) {
          GoRouter.of(context).push(AppRouter.optPhoneNumberView);
        }
        if (state is SendCodeFailure) {
          if (state.errorMessage == 'invalid-phone-number') {
            customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    autoHide: const Duration(seconds: 4),
                    horizontal: 16,
                    title: 'Login Failed',
                    desc:
                        'Sorry, the provided phone number is not valid. Please double-check the number and try again.',
                    dialogType: DialogType.error));
          }
          if (state.errorMessage == 'too-many-requests') {
            customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    autoHide: const Duration(seconds: 4),
                    horizontal: 16,
                    title: 'Login Failed',
                    desc:
                        "Apologies, but we've blocked requests from your device temporarily due to unusual activity. Please try again later. Thank you for your understanding.",
                    dialogType: DialogType.error));
          }
          if (state.errorMessage == 'network-request-failed') {
            customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    autoHide: const Duration(seconds: 4),
                    horizontal: 16,
                    title: 'Login Failed',
                    desc:
                        'Sorry, the network request failed. Please check your network connection and try again.',
                    dialogType: DialogType.error));
          }
        }
      },
      builder: (context, state) {
        return PhoneNumberComponent(
            text: text,
            isLoading: isLoading,
            onChangedPhoneNumber: onChangedPhoneNumber,
            size: size,
            isValue: isValue,
            controller: controller,
            number: number);
      },
    );
  }
}
