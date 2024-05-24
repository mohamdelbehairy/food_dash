import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dash/core/utils/app_colors.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/components/custom_text_field.dart';

class GenderTextField extends StatefulWidget {
  const GenderTextField({super.key, required this.gender});

  final TextEditingController gender;

  @override
  State<GenderTextField> createState() => _GenderTextFieldState();
}

class _GenderTextFieldState extends State<GenderTextField> {
  final items = ['Male', 'Female'];
  bool isValue = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextField(
            textFieldModel: TextFieldModel(
                enabled: false,
                controller: widget.gender,
                hintText: 'Gender',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'gender is required';
                  }
                  return null;
                })),
        Positioned(
            right: 12,
            child: DropdownButton(
              icon: Icon(FontAwesomeIcons.caretDown,
                  size: 18,
                  color:
                      isValue ? Colors.black54 : AppColors.textFieldHintColor),
              items: items.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  widget.gender.text = value;
                  setState(() {
                    isValue = value.isNotEmpty;
                  });
                }
              },
              underline: const SizedBox(),
              borderRadius: BorderRadius.circular(12),
            ))
      ],
    );
  }
}
