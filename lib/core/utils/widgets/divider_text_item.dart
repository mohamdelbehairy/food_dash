import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';

import 'custom_divider_item.dart';

class DividerTextitem extends StatelessWidget {
  const DividerTextitem(
      {super.key, required this.dividerSize, required this.text});

  final double dividerSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDividerItem(dividerSize: dividerSize),
          SizedBox(width: 12),
          Text(text,
              style:
                  AppStyles.styleReqular16.copyWith(color: Color(0xff828282,),fontWeight: FontWeight.w600)),
          SizedBox(width: 12),
          CustomDividerItem(dividerSize: dividerSize),
        ],
      ),
    );
  }
}
