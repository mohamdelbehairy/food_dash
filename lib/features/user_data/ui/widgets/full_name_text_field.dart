import 'package:flutter/material.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/components/custom_text_field.dart';

class FullNameTextField extends StatelessWidget {
  const FullNameTextField(
      {super.key, required this.fullName, required this.isLoading});

  final TextEditingController fullName;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        textFieldModel: TextFieldModel(
            controller: fullName,
            enabled: !isLoading,
            hintText: 'Full Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'full name is required';
              }
              return null;
            }));
  }
}
