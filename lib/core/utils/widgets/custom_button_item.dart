import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_styles.dart';
import 'custom_circle_indicator.dart';

class CustomButtonItem extends StatelessWidget {
  const CustomButtonItem(
      {super.key,
      required this.size,
      this.height,
      this.radius,
      this.buttonColor,
      this.textColor,
      this.borderColor,
      this.width,
      this.textStyle,
      required this.buttonName,
      required this.onTap,
      this.isLoading = false});
  final Size size;
  final double? radius;
  final Color? buttonColor;
  final Color? textColor;
  final String buttonName;
  final Color? borderColor;
  final TextStyle? textStyle;

  final double? height;
  final double? width;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 54,
        decoration: BoxDecoration(
            color: buttonColor ?? AppColors.mainColor,
            borderRadius: BorderRadius.circular(radius ?? 32),
            border: Border.all(
              color: borderColor ?? AppColors.mainColor,
              width: 1.5,
            )
            // color: AppColors.mainColor,
            // borderRadius: BorderRadius.circular(32)
            ),
        child: Center(
            child: isLoading
                ? CustomCircleIndicator()
                : Text(buttonName,
                    style: textStyle ?? AppStyles.styleExtrallLight16)),
      ),
    );
  }
}

