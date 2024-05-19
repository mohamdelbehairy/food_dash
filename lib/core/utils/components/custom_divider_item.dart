import 'package:flutter/material.dart';

class CustomDividerItem extends StatelessWidget {
  const CustomDividerItem({super.key, required this.dividerSize});

  final double dividerSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        width: dividerSize,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(.15)));
  }
}
