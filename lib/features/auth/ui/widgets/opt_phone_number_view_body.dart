import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/remember_me/remember_me_cubit.dart';
import 'opt_phone_number_details.dart';

class OptPhoneNumberViewBody extends StatelessWidget {
  const OptPhoneNumberViewBody(
      {super.key, required this.size, required this.isClick});

  final Size size;
  final RememberMeCubit isClick;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RememberMeCubit, RememberMeState>(
      listener: (context, state) {
        isClick.isClick = isClick.rememberMe();
      },
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: OptPhoneNumberDetails(size: size, isClick: isClick),
        ),
      ),
    );
  }
}
