import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/models/awsome_dialog_model.dart';
import 'package:food_dash/core/utils/logic/get_user_data/get_user_data_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/utils/custom_awsome_dialog.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var userSharedPref = context.read<SharedPrefCubit>();
    return BlocListener<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) async {
        final token =
            await userSharedPref.getSharedPref(key: Constants.userSharedPref);
        if (token.isEmpty) {
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
                  }));
        }
      },
      child: const Scaffold(),
    );
  }
}
