import 'package:flutter/material.dart';
import 'package:food_dash/features/pick_image/ui/models/bottom_sheet_item_model.dart';

import '../../../../core/utils/app_styles.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key, required this.bottomSheetItemModel});

  final BottomSheetItemModel bottomSheetItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bottomSheetItemModel.onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Icon(bottomSheetItemModel.icon),
            SizedBox(width: 16),
            Text(bottomSheetItemModel.text, style: AppStyles.styleBold16),
          ],
        ),
      ),
    );
  }
}
