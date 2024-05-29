import 'package:flutter/material.dart';
import 'package:food_dash/features/image/logic/pick_image/pick_image_cubit.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_divider_item.dart';
import '../../../../core/utils/widgets/custom_text_item.dart';
import 'bottom_sheet_list_view.dart';

class BottomSheetItemBody extends StatelessWidget {
  const BottomSheetItemBody({super.key, required this.pickImage});
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    
    return SizedBox(
      height: size.height * .24,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 5),
            CustomDividerItem(dividerSize: 32, color: Colors.grey, height: 5),
            SizedBox(height: size.height * .015),
            CustomTextItem(
                style: AppStyles.styleBold16, text: 'Add a profile picture'),
            SizedBox(height: size.height * .015),
            BottomSheetListView(pickImage: pickImage)
          ],
        ),
      ),
    );
  }
}
