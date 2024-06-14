import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';


class AnimatedPageIndicatorOnboarding extends StatelessWidget {
  const AnimatedPageIndicatorOnboarding({
    super.key,
    required this.check,
  });
  final bool check;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: check? 60:10,
      
      height: check ? 8 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: check?AppColors.mainColor:Colors.white,
        border: Border.all(color:check? AppColors.mainColor:Colors.white,width: 1)
      ),
    );
  }
}
