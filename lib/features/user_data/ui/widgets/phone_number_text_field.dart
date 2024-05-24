import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField(
      {super.key, required this.size, required this.textFieldModel});
  final Size size;
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(size.width * .02),
        child: IntlPhoneField(
            enabled: true,
            // flagsButtonPadding: EdgeInsets.only(left: !enabled ? 28 : 0),

            onChanged: textFieldModel.onChangedPhoneNumber,
            initialCountryCode: 'EG',
            disableLengthCheck: textFieldModel.controller.text.isEmpty,
            controller: textFieldModel.controller,
            dropdownIcon:
                Icon(Icons.expand_more, color: textFieldModel.suffixIconColor),
            dropdownTextStyle: TextStyle(
              color: textFieldModel.suffixIconColor,
              fontWeight: FontWeight.w500,
            ),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: size.width * .035),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: textFieldModel.hintText,
                hintStyle: AppStyles.styleReqular14
                    .copyWith(color: AppColors.textFieldHintColor),
                filled: true,
                fillColor:
                    textFieldModel.fillColor ?? const Color(0xfffafbfb))));
  }
}
