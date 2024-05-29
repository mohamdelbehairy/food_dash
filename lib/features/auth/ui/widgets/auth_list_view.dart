import 'package:flutter/material.dart';

import '../../../../core/models/text_field_model.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class AuthListView extends StatelessWidget {
  const AuthListView({super.key, required this.items});

  final List<TextFieldModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CustomTextField(
              textFieldModel: items[index],
            ),
          );
        });
  }
}
