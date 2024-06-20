import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
import '../../logic/phone_number/phone_number_cubit.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import 'opt_phone_number_component.dart';

class OptPhoneNumberDetails extends StatelessWidget {
  const OptPhoneNumberDetails(
      {super.key, required this.size, required this.isClick});

  final Size size;
  final RememberMeCubit isClick;

  @override
  Widget build(BuildContext context) {
    var verifyNumber = context.read<PhoneNumberCubit>();
    var sharedPref = context.read<SharedPrefCubit>();

    return BlocListener<PhoneNumberCubit, PhoneNumberState>(
        listener: (context, state) async {
          if (state is VerifyPhoneNumberSuccess) {
            if (isClick.isClick) {
              await sharedPref.setSharedPref(
                  key: Constants.userSharedPref,
                  value: FirebaseAuth.instance.currentUser!.uid);
            }
            await sharedPref.setSharedPref(
                key: Constants.useAppFirstTime, value: 'done');
            await sharedPref.setSharedPref(
                key: Constants.isPhoneAuth, value: 'phone');

            
            Future.delayed(const Duration(seconds: 2),
                () => GoRouter.of(context).go(AppRouter.userDataView));
          }
        },
        child: OptPhoneNumberComponent(size: size, verifyNumber: verifyNumber));
  }
}
