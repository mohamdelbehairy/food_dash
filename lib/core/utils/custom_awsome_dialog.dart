import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:food_dash/core/models/awsome_dialog_model.dart';

AwesomeDialog customAwsomeDialog(
    {required AwsomeDialogModel awsomeDialogModel}) {
  return AwesomeDialog(
      context: awsomeDialogModel.context,
      dialogType: awsomeDialogModel.dialogType,
      animType: awsomeDialogModel.animType,
      title: awsomeDialogModel.title,
      desc: awsomeDialogModel.desc,
      showCloseIcon: awsomeDialogModel.showCloseIcon,
      btnCancelOnPress: awsomeDialogModel.btnCancelOnPress,
      btnOkOnPress: awsomeDialogModel.btnOkOnPress);
}
