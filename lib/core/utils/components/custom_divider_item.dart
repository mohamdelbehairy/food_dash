import 'package:flutter/material.dart';

class CustomDividerItem extends StatelessWidget {
  const CustomDividerItem(
      {super.key, required this.dividerSize, this.color, this.height});

  final double dividerSize;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 1,
        width: dividerSize,
        decoration:
            BoxDecoration(color: color ?? Colors.grey.withOpacity(.15)));
  }
}
