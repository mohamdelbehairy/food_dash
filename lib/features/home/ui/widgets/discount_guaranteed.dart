import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/ui/widgets/discount_guaranteed_body.dart';

class DiscountGuaranteed extends StatelessWidget {
  const DiscountGuaranteed({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discount Guaranteed',
                    style:
                        AppStyles.styleSemiBold16.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '👌',
                    style: AppStyles.styleSemiBold14,
                  ),
                ],
              ),
              Text(
                'See All',
                style: AppStyles.styleSemiBold16,
              ),
            ],
          ),
        ),
        DiscountGuaranteedBody()
      ],
    );
  }
}
