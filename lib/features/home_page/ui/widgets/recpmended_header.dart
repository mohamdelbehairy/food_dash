import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:go_router/go_router.dart';

class RecommendedHeader extends StatelessWidget {
  const RecommendedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommended For You',
                style: AppStyles.styleSemiBold16.copyWith(color: Colors.black),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '😍',
                style: AppStyles.styleSemiBold14,
              ),
            ],
          ),
          GestureDetector(
            onTap: () => GoRouter.of(context).push(AppRouter.recommended_for_you),
            child: Text(
              'See All',
              style: AppStyles.styleSemiBold16,
            ),
          ),
        ],
      ),
    );
  }
}
