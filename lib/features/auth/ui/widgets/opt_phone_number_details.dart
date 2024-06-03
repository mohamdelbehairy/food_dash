import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
import '../../../../core/utils/widgets/custom_button_item.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../logic/phone_number/phone_number_cubit.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import 'opt_phone_number_view_pinput.dart';
import 'resend_code_widget.dart';

class OptPhoneNumberDetails extends StatefulWidget {
  const OptPhoneNumberDetails(
      {super.key, required this.size, required this.isClick});

  final Size size;
  final RememberMeCubit isClick;

  @override
  State<OptPhoneNumberDetails> createState() => _OptPhoneNumberDetailsState();
}

class _OptPhoneNumberDetailsState extends State<OptPhoneNumberDetails> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var verifyNumber = context.read<PhoneNumberCubit>();
    var sharedPref = context.read<SharedPrefCubit>();

    return BlocListener<PhoneNumberCubit, PhoneNumberState>(
      listener: (context, state) async {
        if (state is VerifyPhoneNumberSuccess) {
          if (widget.isClick.isClick) {
            await sharedPref.setSharedPref(
                key: Constants.userSharedPref,
                value: FirebaseAuth.instance.currentUser!.uid);
          }
          await sharedPref.setSharedPref(
              key: Constants.useAppFirstTime, value: 'done');
          var device = DeviceInfoPlugin();
          var android = await device.androidInfo;
          await sharedPref.setSharedPref(
              key: Constants.mobileInfo, value: android.board);
          Future.delayed(const Duration(seconds: 2),
              () => GoRouter.of(context).go(AppRouter.userDataView));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: widget.size.height * .26),
          CustomTextItem(
              style: AppStyles.styleSemiBold18,
              text: 'Code has been sent to +1 111 ******99'),
          OptPhoneNumberViewPinput(
            controller: controller,
            onCompleted: (value) async {
              await verifyNumber.verifyPhoneNumber(smsCode: value);
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(seconds: 2));
              setState(() {
                isLoading = false;
              });
            },
          ),
          ResendCodeWidget(),
          SizedBox(height: widget.size.height * .02),
          CustomButtonItem(
              isLoading: isLoading,
              size: widget.size,
              buttonName: 'Verify',
              onTap: () async {
                await verifyNumber.verifyPhoneNumber(smsCode: controller.text);
              }),
        ],
      ),
    );
  }
}
