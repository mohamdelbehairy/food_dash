import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/widgets/custom_circle_indicator.dart';

import 'verification_view_button.dart';
import 'verification_view_texts.dart';
import 'verification_view_title_icon.dart';

class VerificationViewSection extends StatelessWidget {
  const VerificationViewSection(
      {super.key, required this.size, required this.isEmailVerified});

  final Size size;
  final bool isEmailVerified;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          VerificationViewTitleIcon(size: size),
          SizedBox(height: size.width * .05),
          VerificationViewTexts(size: size),
          if (isEmailVerified) SizedBox(height: size.width * .1),
          if (isEmailVerified)
            SizedBox(
                height: 30,
                width: 30,
                child: CustomCircleIndicator(color: AppColors.mainColor)),
          SizedBox(height: size.width * .15),
          if (!isEmailVerified) VerificationViewButton(size: size)
        ],
      ),
    );
  }
}
