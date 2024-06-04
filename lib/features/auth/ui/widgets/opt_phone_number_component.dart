import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button_item.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../logic/phone_number/phone_number_cubit.dart';
import 'opt_phone_number_view_pinput.dart';
import 'resend_code_widget.dart';

class OptPhoneNumberComponent extends StatefulWidget {
  const OptPhoneNumberComponent(
      {super.key, required this.size, required this.verifyNumber});

  final Size size;

  final PhoneNumberCubit verifyNumber;

  @override
  State<OptPhoneNumberComponent> createState() =>
      _OptPhoneNumberComponentState();
}

class _OptPhoneNumberComponentState extends State<OptPhoneNumberComponent> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  int start = 59;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: widget.size.height * .26),
            CustomTextItem(
                style: AppStyles.styleSemiBold18,
                text:
                    'Code has been sent to ${widget.verifyNumber.getNumber()}'),
            OptPhoneNumberViewPinput(
              controller: controller,
              onCompleted: (value) async {
                await widget.verifyNumber.verifyPhoneNumber(smsCode: value);
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  isLoading = false;
                });
              },
            ),
            ResendCodeWidget(start: start),
            SizedBox(height: widget.size.height * .02),
            CustomButtonItem(
                isLoading: isLoading,
                size: widget.size,
                buttonName: 'Verify',
                onTap: () async {
                  await widget.verifyNumber
                      .verifyPhoneNumber(smsCode: controller.text);
                }),
          ],
        );
      },
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (timer) {
      if (mounted) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      }
    });
  }
}
