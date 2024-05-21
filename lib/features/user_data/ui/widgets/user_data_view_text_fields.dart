import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/components/custom_text_field.dart';
import 'phone_number_text_field.dart';

class UserDataViewTextFields extends StatelessWidget {
  const UserDataViewTextFields({super.key, required this.size});
  final Size size;

  static List<TextFieldModel> items = [
    TextFieldModel(controller: TextEditingController(), hintText: 'Full Name'),
    TextFieldModel(controller: TextEditingController(), hintText: 'Nickname'),
    TextFieldModel(
        enabled: false,
        controller: TextEditingController(),
        hintText: 'Date of Birth',
        suffixIcon: FontAwesomeIcons.calendarDays),
    TextFieldModel(
        keyboardType: TextInputType.emailAddress,
        controller: TextEditingController(),
        hintText: 'Email',
        suffixIcon: FontAwesomeIcons.solidEnvelope),
    TextFieldModel(
        keyboardType: TextInputType.emailAddress,
        controller: TextEditingController(),
        hintText: '000 000 000',
        suffixIcon: FontAwesomeIcons.solidEnvelope),
    TextFieldModel(
        enabled: false,
        controller: TextEditingController(),
        hintText: 'Gender',
        suffixIcon: Icons.arrow_drop_down,
        suffizyIconSize: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: index == 4
                  ? PhoneNumberTextField(
                      size: size, textFieldModel: items[index])
                  : CustomTextField(textFieldModel: items[index]));
        });
  }
}
