import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/app_details/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import '../../logic/remember_me/remember_me_cubit.dart';

class RememberMeItem extends StatelessWidget {
  const RememberMeItem({super.key, required this.isClick});
  final RememberMeCubit isClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () => isClick.rememberMe(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Icon(
                  isClick.isClick
                      ? FontAwesomeIcons.solidSquareCheck
                      : Icons.check_box_outline_blank,
                  size: 22,
                  color: AppColors.mainColor),
            )),
        const SizedBox(width: 12),
        CustomTextItem(style: AppStyles.styleBold14, text: 'Remember me'),
      ],
    );
  }
}
