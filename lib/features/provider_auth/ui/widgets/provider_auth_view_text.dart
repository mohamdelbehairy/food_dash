import 'package:flutter/material.dart';


class ProviderAuthViewText extends StatelessWidget {
  const ProviderAuthViewText({super.key, required this.style, required this.text});
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(text, style: style);
  }
}