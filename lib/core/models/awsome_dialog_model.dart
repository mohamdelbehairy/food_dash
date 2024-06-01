import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwsomeDialogModel {
  final BuildContext context;
  final DialogType dialogType;
  final AnimType animType;
  String? title, desc;
  Function()? btnCancelOnPress, btnOkOnPress;
  bool showCloseIcon;

  AwsomeDialogModel(
      {required this.context,
      this.dialogType = DialogType.info,
      this.animType = AnimType.scale,
      this.title,
      this.desc,
      this.btnCancelOnPress,
      this.btnOkOnPress,
      this.showCloseIcon = false});
}
