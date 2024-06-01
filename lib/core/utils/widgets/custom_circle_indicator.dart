import 'package:flutter/material.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color ?? Colors.white);
  }
}
