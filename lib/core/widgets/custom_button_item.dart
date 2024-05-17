import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButtonItem extends StatelessWidget {
  const CustomButtonItem(
      {super.key,
      required this.size,
      required this.buttonName,
      required this.onTap});
  final Size size;
  final String buttonName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(32)),
        child: Center(
            child: Text(buttonName, style: AppStyles.styleExtrallLight16)),
      ),
    );
  }
}
