import 'package:flutter/material.dart';

import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/app_details/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../logic/phone_number/phone_number_cubit.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({super.key, required this.getNumber});

  final PhoneNumberCubit getNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          debugPrint('number: ${getNumber.getNumber()}');
          await getNumber.signInWithPhoneNumber(
              phoneNumber: getNumber.getNumber());
        },
        child: CustomTextItem(
            style:
                AppStyles.styleReqular14.copyWith(color: AppColors.mainColor),
            text: 'Resend Code'));
  }
}
