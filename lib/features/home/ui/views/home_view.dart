import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/models/awsome_dialog_model.dart';
import 'package:food_dash/core/utils/logic/get_user_data/get_user_data_cubit.dart';
import 'package:food_dash/core/utils/logic/user_data_setting/user_data_setting_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/utils/custom_awsome_dialog.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var userSharedPref = context.read<SharedPrefCubit>();
    var updateUserData = context.read<UserDataSettingCubit>();
    return BlocListener<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) {
        if (state is GetUserDataSuccess && state.user.isNotEmpty) {
          final userData = state.user.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);

          if (userData.isRememberMe == null) {
            customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    showCloseIcon: true,
                    title: "Remember me",
                    desc: "Are you want to remember this account?",
                    btnOkOnPress: () async {
                      await userSharedPref.setSharedPref(
                          key: Constants.userSharedPref,
                          value: FirebaseAuth.instance.currentUser!.uid);
                      await updateUserData.updateUserData(
                          fieldName: Constants.isRememberMeField,
                          fieldValueBool: true);
                    })).show();
          }
        }
      },
      child: const Scaffold(),
    );
  }
}
