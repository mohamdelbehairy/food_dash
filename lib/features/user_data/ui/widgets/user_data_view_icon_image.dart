import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';

import '../../../pick_image/logic/pick_image/pick_image_cubit.dart';
import '../../../pick_image/ui/widgets/bottom_sheet_item_body.dart';

class UserDataViewIconImage extends StatelessWidget {
  const UserDataViewIconImage({super.key, required this.pickImage});
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      bottom: 4,
      child: InkWell(
          onTap: () => showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (context) => BottomSheetItemBody(pickImage: pickImage)),
          child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(4)),
              child:
                  Icon(FontAwesomeIcons.pen, color: Colors.white, size: 16))),
    );
  }
}
