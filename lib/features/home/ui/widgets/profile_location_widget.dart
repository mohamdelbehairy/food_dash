import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';

import '../../../../core/utils/app_details/app_styles.dart';

class ProfileLocationWidget extends StatelessWidget {
  const ProfileLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Deliver to',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16)),
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Times Square',
                style: AppStyles.styleSemiBold16.copyWith(color: Colors.black)),
            SizedBox(width: 10),
            Icon(Icons.arrow_drop_down, color: AppColors.mainColor, size: 30)
          ],
        ),
      ],
    );
  }
}
