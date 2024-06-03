import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../../user_data/ui/widgets/phone_number_text_field.dart';

class PhoneNumberViewColumnOne extends StatelessWidget {
  const PhoneNumberViewColumnOne(
      {super.key,
      required this.size,
      required this.isValue,
      required this.controller,
      this.onChangedPhoneNumber});

  final Size size;
  final bool isValue;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChangedPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 90),
        drawSvgIconColored('app_icon1', height: 100, width: 100),
        const SizedBox(height: 32),
        CustomTextItem(
            style: AppStyles.styleSemiBold28, text: 'Create New Account'),
        const SizedBox(height: 28),
        PhoneNumberTextField(
            size: size,
            isLoading: false,
            textFieldModel: TextFieldModel(
                hintText: '000 000 000',
                suffixIconColor:
                    isValue ? Colors.black : AppColors.textFieldHintColor,
                controller: controller,
                onChangedPhoneNumber: onChangedPhoneNumber)),
        const SizedBox(height: 24),
      ],
    );
  }
}
