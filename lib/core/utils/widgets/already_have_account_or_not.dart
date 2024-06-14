import 'package:flutter/material.dart';
import '../app_details/app_styles.dart';
import 'custom_text_item.dart';

class AlreadyHaveAccountOrNot extends StatelessWidget {
  const AlreadyHaveAccountOrNot(
      {super.key,
      required this.text,
      required this.textButton,
      required this.onTap});
  final String text;
  final String textButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomTextItem(text: text, style: AppStyles.styleReqular14),
      const SizedBox(width: 6),
      GestureDetector(
        onTap: onTap,
        child:
            CustomTextItem(text: textButton, style: AppStyles.styleSemiBold14),
      )
    ]);
  }
}
