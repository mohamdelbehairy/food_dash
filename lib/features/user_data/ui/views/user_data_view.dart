import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/components/custom_app_bar.dart';
import 'package:food_dash/features/image/logic/pick_image/pick_image_cubit.dart';
import 'package:food_dash/features/image/logic/upload_image/upload_image_cubit.dart';
import 'package:food_dash/features/user_data/logic/store_user_data/store_user_data_cubit.dart';

import '../widgets/user_data_view_body.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PickImageCubit()),
        BlocProvider(create: (context) => UploadImageCubit()),
        BlocProvider(create: (context) => StoreUserDataCubit()),
      ],
      child: Scaffold(
          appBar:
              customAppbar(appBarText: 'Fill Your Profile', titleSpacing: 20),
          body: UserDataViewBody(size: size)),
    );
  }
}
