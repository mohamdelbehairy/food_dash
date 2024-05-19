import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/auth_text_field_model.dart';
import 'auth_text_field.dart';

class ListViewTextField extends StatelessWidget {
  const ListViewTextField({super.key});

  static List<AuthTextFieldModel> items = [
    AuthTextFieldModel(
        hintText: 'Email',
        prefixIcon: FontAwesomeIcons.solidEnvelope,
        keyboardType: TextInputType.emailAddress,
        controller: TextEditingController()),
    AuthTextFieldModel(
        hintText: 'Password',
        prefixIcon: Icons.password,
        obscureText: true,
        controller: TextEditingController()),
    AuthTextFieldModel(
        hintText: 'Confirm Password',
        prefixIcon: Icons.password,
        obscureText: true,
        controller: TextEditingController())
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: AuthTextField(
              authTextFieldModel: items[index],
            ),
          );
        });
  }
}
