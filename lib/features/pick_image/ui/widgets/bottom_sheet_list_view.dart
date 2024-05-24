import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../logic/pick_image/pick_image_cubit.dart';
import '../models/bottom_sheet_item_model.dart';
import 'bottom_sheet_item.dart';

class BottomSheetListView extends StatelessWidget {
  const BottomSheetListView({super.key, required this.pickImage});
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetItem(
            bottomSheetItemModel: BottomSheetItemModel(
          text: 'Take photo',
          icon: Icons.camera_alt_rounded,
          onTap: () async {
            debugPrint('Take photo');
            await pickImage.pickImage(source: ImageSource.camera);
          },
        )),
        BottomSheetItem(
            bottomSheetItemModel: BottomSheetItemModel(
          text: 'Choose from gallery',
          icon: Icons.collections,
          onTap: () async{
            debugPrint('Choose from gallery');
            await pickImage.pickImage(source: ImageSource.gallery);
          },
        )),
        BottomSheetItem(
            bottomSheetItemModel: BottomSheetItemModel(
          text: 'Use avatar',
          icon: Icons.face,
          onTap: () {
            debugPrint('Use avatar');
          },
        )),
      ],
    );
  }
}
