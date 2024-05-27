import 'package:flutter/material.dart';

class CustomTextItem extends StatelessWidget {
  const CustomTextItem(
      {super.key, required this.style, required this.text, this.textAlign});
  final TextStyle style;
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style,textAlign: textAlign);
  }
}
