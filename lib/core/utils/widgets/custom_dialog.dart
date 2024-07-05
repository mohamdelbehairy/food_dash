import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Image.asset(Assets.imagesDialogEnhanced),
             Text(
                'Congratulations!',
                style: AppStyles.styleSemiBold16.copyWith(fontSize: 20),
              ),
              SizedBox(height: 16.0),
              Text(
                'Your account is ready to use, you will be redirected to the Home page in s few seconds.',
                textAlign: TextAlign.center,
                style: AppStyles.styleBold14,
              ),
              SizedBox(height: 24.0),
               LoadingAnimationWidget.hexagonDots(
                 color: AppColors.mainColor,
                 size: 56,
               ),
            ],
          ),
        ),
      );
    },
  );
}
