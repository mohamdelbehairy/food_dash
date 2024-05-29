import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';

class RememberMeItem extends StatelessWidget {
  const RememberMeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 17,
            width: 17,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        const SizedBox(width: 16),
        CustomTextItem(style: AppStyles.styleBold14, text: 'Remember me'),
      ],
    );
  }
}
