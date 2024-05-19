import 'package:flutter/material.dart';

class CustomTextItem extends StatelessWidget {
  const CustomTextItem(
      {super.key, required this.style, required this.text});
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
