import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';

class SpecialOfferHeader extends StatelessWidget {
  const SpecialOfferHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Special Offers',
          style: AppStyles.styleSemiBold16.copyWith(color: Colors.black),
        ),
        Text(
          'See All',
          style: AppStyles.styleSemiBold16,
        ),
      ],
    );
  }
}
