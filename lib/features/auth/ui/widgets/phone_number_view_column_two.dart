import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/phone_number/phone_number_cubit.dart';

import '../../../../core/utils/widgets/custom_button_item.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import 'remember_me_item.dart';

class PhoneNumberViewColumnTwo extends StatelessWidget {
  const PhoneNumberViewColumnTwo(
      {super.key,
      required this.size,
      required this.number,
      required this.controller,
      required this.isLoading});

  final Size size;
  final String number;
  final TextEditingController controller;
  final PhoneNumberCubit isLoading;

  @override
  Widget build(BuildContext context) {
    var isClick = context.read<RememberMeCubit>();
    var signiInWithPhoneNumber = context.read<PhoneNumberCubit>();

    return BlocBuilder<RememberMeCubit, RememberMeState>(
      builder: (context, state) {
        return Column(
          children: [
            RememberMeItem(isClick: isClick),
            const SizedBox(height: 16),
            CustomButtonItem(
                isLoading: isLoading.isLoading,
                size: size,
                buttonName: 'Sign up',
                onTap: () async {
                  if (controller.text.isNotEmpty) {
                    await signiInWithPhoneNumber.signInWithPhoneNumber(
                        phoneNumber: number);
                  }
                })
          ],
        );
      },
    );
  }
}
