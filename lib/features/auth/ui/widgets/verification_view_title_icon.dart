import 'package:flutter/material.dart';

import '../../../../core/utils/app_details/app_colors.dart';

class VerificationViewTitleIcon extends StatelessWidget {
  const VerificationViewTitleIcon({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size.height * .04,
        backgroundColor: AppColors.mainColor.withOpacity(.07),
        child: CircleAvatar(
            radius: size.height * .03,
            backgroundColor: AppColors.mainColor.withOpacity(.1),
            child: Icon(Icons.email,
                color: AppColors.mainColor, size: size.height * .03)));
  }
}
