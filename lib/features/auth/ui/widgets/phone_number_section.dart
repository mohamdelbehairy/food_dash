import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/auth/logic/phone_number/phone_number_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../constants.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
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
    var getSharedPref = context.read<SharedPrefCubit>();

    return BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
      listener: (context, state) async {
        if (state is SendCodeLoading) {
          isLoading.isLoading = state.isLoading;
          debugPrint('isLoading: ${isLoading.isLoading}');
        }

        var device = DeviceInfoPlugin();
        var android = await device.androidInfo;
        final mobileInfo =
            await getSharedPref.getSharedPref(key: Constants.mobileInfo);

        if (mobileInfo == android.board) {
          GoRouter.of(context).push(AppRouter.homeView);
        }
        if (state is SendCodeSuccess && mobileInfo != android.board) {
          GoRouter.of(context).push(AppRouter.optPhoneNumberView);
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
