import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/components/custom_app_bar.dart';
import 'package:food_dash/features/pick_image/logic/pick_image/pick_image_cubit.dart';

import '../widgets/user_data_view_body.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => PickImageCubit(),
      child: Scaffold(
          appBar:
              customAppbar(appBarText: 'Fill Your Profile', titleSpacing: 20),
          body: UserDataViewBody(size: size)),
    );
  }
}
