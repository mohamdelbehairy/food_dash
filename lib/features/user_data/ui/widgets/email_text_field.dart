import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField(
      {super.key, required this.email, required this.isLoading});

  final TextEditingController email;
  final bool isLoading;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool isValue = false;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        textFieldModel: TextFieldModel(
          enabled: !widget.isLoading,
            validator: (value) {
              if (value!.isNotEmpty && !EmailValidator.validate(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                isValue = value.isNotEmpty;
              });
            },
            keyboardType: TextInputType.emailAddress,
            controller: widget.email,
            hintText: 'Email',
            suffixIcon: FontAwesomeIcons.solidEnvelope,
            suffixIconColor:
                isValue ? Colors.black54 : AppColors.textFieldHintColor));
  }
}
