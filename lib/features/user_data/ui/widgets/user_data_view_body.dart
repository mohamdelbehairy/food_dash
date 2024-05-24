import 'package:flutter/material.dart';

import '../../../../core/utils/components/custom_button_item.dart';
import 'user_data_view_image_item.dart';
import 'user_data_view_text_fields.dart';

class UserDataViewBody extends StatelessWidget {
  const UserDataViewBody({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            UserDataViewImageItem(),
            UserDataViewTextFields(size: size),
            const SizedBox(height: 32),
            CustomButtonItem(size: size, buttonName: 'Continue', onTap: () {}),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
