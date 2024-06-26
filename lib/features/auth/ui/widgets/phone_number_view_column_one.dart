import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/handler/icon_handler.dart';
import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/app_details/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../../user_data/ui/widgets/phone_number_text_field.dart';
import '../../logic/phone_number/phone_number_cubit.dart';

class PhoneNumberViewColumnOne extends StatelessWidget {
  const PhoneNumberViewColumnOne(
      {super.key,
      required this.size,
      required this.isValue,
      required this.controller,
      this.onChangedPhoneNumber,
      required this.text,
      required this.isLoading});

  final Size size;
  final bool isValue;
   final PhoneNumberCubit isLoading;
  final TextEditingController controller;
  final Function(PhoneNumber)? onChangedPhoneNumber;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height * .15),
        drawSvgIconColored('app_icon1', height: 100, width: 100),
        const SizedBox(height: 32),
        CustomTextItem(style: AppStyles.styleSemiBold28, text: text),
        const SizedBox(height: 28),
        PhoneNumberTextField(
            size: size,
            isLoading: isLoading.isLoading,
            textFieldModel: TextFieldModel(
                hintText: '000 000 000',
                fillColor: isValue
                    ? AppColors.textFieldFocusColor
                    : const Color(0xfffafbfb),
                borderSideColor:
                    isValue ? AppColors.mainColor : Colors.transparent,
                suffixIconColor:
                    isValue ? Colors.black : AppColors.textFieldHintColor,
                controller: controller,
                onChangedPhoneNumber: onChangedPhoneNumber)),
        const SizedBox(height: 24),
      ],
    );
  }
}
