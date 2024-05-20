import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/custom_button_item.dart';
import '../../../../core/utils/components/custom_text_item.dart';
import 'opt_phone_number_view_pinput.dart';
import 'resend_code_widget.dart';

class OptPhoneNumberViewBody extends StatelessWidget {
  const OptPhoneNumberViewBody({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            CustomButtonItem(size: size, buttonName: 'Verify', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
