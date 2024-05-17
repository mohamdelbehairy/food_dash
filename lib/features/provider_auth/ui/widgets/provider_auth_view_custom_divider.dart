import 'package:flutter/material.dart';

class ProviderAuthViewCustomDivider extends StatelessWidget {
  const ProviderAuthViewCustomDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        width: size.width * .36,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(.2)));
  }
}
