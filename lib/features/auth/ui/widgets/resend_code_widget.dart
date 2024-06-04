import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/phone_number/phone_number_cubit.dart';
import 'resend_code_button.dart';
import 'resend_code_timer.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key, required this.start});
  final int start;

  @override
  Widget build(BuildContext context) {
    var getNumber = context.read<PhoneNumberCubit>();
    return start == 0
        ? ResendCodeButton(getNumber: getNumber)
        : ResendCodeTimer(start: start);
  }
}

