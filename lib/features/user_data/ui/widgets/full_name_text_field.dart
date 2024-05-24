import 'package:flutter/material.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/components/custom_text_field.dart';

class FullNameTextField extends StatelessWidget {
  const FullNameTextField({super.key, required this.fullName});

  final TextEditingController fullName;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        textFieldModel: TextFieldModel(
            controller: fullName,
            hintText: 'Full Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'full name is required';
              }
              return null;
            }));
  }
}
