import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dash/core/utils/app_colors.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class GenderTextField extends StatefulWidget {
  const GenderTextField(
      {super.key,
      required this.gender,
      required this.size,
      required this.isLoading});

  final TextEditingController gender;
  final Size size;
  final bool isLoading;

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
            top: widget.isLoading ? 16: 0,
            child: widget.isLoading
                ? Icon(FontAwesomeIcons.caretDown,
                    size: 18, color: AppColors.textFieldHintColor)
                : DropdownButton(
                    icon: Icon(FontAwesomeIcons.caretDown,
                        size: 18,
                        color: isValue
                            ? Colors.black54
                            : AppColors.textFieldHintColor),
                    items: items.map((item) {
                      return DropdownMenuItem(
                          value: item,
                          child: SizedBox(
                              width: widget.size.width * .8,
                              child: Text(item)));
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
