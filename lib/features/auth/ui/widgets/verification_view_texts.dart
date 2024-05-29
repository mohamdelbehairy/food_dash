import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';

class VerificationViewTexts extends StatelessWidget {
  const VerificationViewTexts({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextItem(
            style: AppStyles.styleBold16.copyWith(fontSize: 18),
            text: 'Please verify your email'),
        SizedBox(height: size.width * .035),
        CustomTextItem(
            style: AppStyles.styleBold14,
            text: 'You\'re almost there! We sent an email to'),
        SizedBox(height: size.width * .01),
        CustomTextItem(
            style: AppStyles.styleSemiBold14, text: 'totomohamad016@gmail.com'),
        SizedBox(height: size.width * .04),
        CustomTextItem(
            style: AppStyles.styleBold14,
            textAlign: TextAlign.center,
            text:
                'Just click on the link that email to complete your signup. If you don\'t see it, you may need to Check your spam folder.'),
        SizedBox(height: size.width * .035),
        CustomTextItem(
            style: AppStyles.styleBold14,
            text: 'Still can\'t find the email? No problem.'),
      ],
    );
  }
}
