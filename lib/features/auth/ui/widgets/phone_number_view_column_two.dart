import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/custom_button_item.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import 'remember_me_item.dart';

class PhoneNumberViewColumnTwo extends StatelessWidget {
  const PhoneNumberViewColumnTwo(
      {super.key,
      required this.size,
      required this.number,
      required this.controller});

  final Size size;
  final String number;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var isClick = context.read<RememberMeCubit>();
    return BlocBuilder<RememberMeCubit, RememberMeState>(
      builder: (context, state) {
        return Column(
          children: [
            RememberMeItem(isClick: isClick),
            const SizedBox(height: 16),
            CustomButtonItem(
                size: size,
                buttonName: 'Sign up',
                onTap: () {
                  if (controller.text.isNotEmpty) {
                    debugPrint('number: $number');
                    debugPrint('number: ${controller.text}');
                  }
                  GoRouter.of(context).push(AppRouter.optPhoneNumberView);
                })
          ],
        );
      },
    );
  }
}
