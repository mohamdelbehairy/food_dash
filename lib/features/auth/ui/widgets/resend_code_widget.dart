import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/custom_text_item.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextItem(
            style: AppStyles.styleReqular14.copyWith(color: Colors.black),
            text: 'Resend Code in '),
        CustomTextItem(style: AppStyles.styleMedium16, text: '55 '),
        CustomTextItem(
            style: AppStyles.styleReqular16.copyWith(color: Colors.black),
            text: 's')
      ],
    );
  }
}
