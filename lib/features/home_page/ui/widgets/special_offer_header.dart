import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:go_router/go_router.dart';

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
        GestureDetector(
          onTap: () => GoRouter.of(context).go(
            AppRouter.special_offers,
          ),
          child: Text(
            'See All',
            style: AppStyles.styleSemiBold16,
          ),
        ),
      ],
    );
  }
}
