import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components/custom_text_field.dart';

class DateOfBirthTextField extends StatefulWidget {
  const DateOfBirthTextField({super.key, required this.dateOfBirth});

  final TextEditingController dateOfBirth;

  @override
  State<DateOfBirthTextField> createState() => _DateOfBirthTextFieldState();
}

class _DateOfBirthTextFieldState extends State<DateOfBirthTextField> {
  bool isValue = false;

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      widget.dateOfBirth.text = '${value!.month}-${value.day}-${value.year}';
      setState(() {
        isValue = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextField(
            textFieldModel: TextFieldModel(
          enabled: false,
          controller: widget.dateOfBirth,
          // onChanged: (value) {
          //   setState(() {
          //     isValue = value.isNotEmpty;
          //   });
          // },
          hintText: 'Date of Birth',
        )),
        Positioned(
            right: 16,
            bottom: 16,
            child: GestureDetector(
              onTap: _showDatePicker,
              child: Icon(
                FontAwesomeIcons.calendarDays,
                size: 14,
                color: isValue
                    ? Colors.black54
                    : AppColors.textFieldHintColor,
              ),
            ))
      ],
    );
  }
}
