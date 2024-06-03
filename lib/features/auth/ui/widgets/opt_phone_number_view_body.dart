import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button_item.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import 'opt_phone_number_view_pinput.dart';
import 'resend_code_widget.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * .26),
              CustomTextItem(
                  style: AppStyles.styleSemiBold18,
                  text: 'Code has been sent to +1 111 ******99'),
              OptPhoneNumberViewPinput(),
              ResendCodeWidget(),
              SizedBox(height: size.height * .02),
              CustomButtonItem(
                  size: size,
                  buttonName: 'Verify',
                  onTap: () {
                    debugPrint('isClick: ${isClick.isClick}');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
