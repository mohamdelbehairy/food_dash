import 'package:flutter/material.dart';
import 'package:food_dash/core/models/modal_progress_model.dart';
import 'package:food_dash/core/utils/widgets/custom_circle_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModalprogressHUD extends StatelessWidget {
  const CustomModalprogressHUD({super.key, required this.modalProgressModel});
  final ModalProgressModel modalProgressModel;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: modalProgressModel.inAsyncCall,
        offset: modalProgressModel.offset,
        progressIndicator: CustomCircleIndicator(
            color: modalProgressModel.progressIndicatorColor),
        opacity: modalProgressModel.opacity,
        color: modalProgressModel.modalprogressColor,
        child: modalProgressModel.child);
  }
}
