import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';

class ResendCodeTimer extends StatelessWidget {
  const ResendCodeTimer({super.key, required this.start});

  final int start;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextItem(
            style: AppStyles.styleReqular14.copyWith(color: Colors.black),
            text: 'Resend Code in '),
        CustomTextItem(style: AppStyles.styleMedium16, text: '00:$start '),
        CustomTextItem(
            style: AppStyles.styleReqular16.copyWith(color: Colors.black),
            text: 's')
      ],
    );
  }
}
