import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';
import 'package:food_dash/features/auth/logic/google_auth/google_auth_cubit.dart';
import 'package:food_dash/features/auth/logic/remember_me/remember_me_cubit.dart';

import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
import '../../../../core/utils/logic/user_data_setting/user_data_setting_cubit.dart';
import '../../../user_data/logic/store_user_data/store_user_data_cubit.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var storeUserData = context.read<StoreUserDataCubit>();
    var isUserData = context.read<UserDataSettingCubit>();
    var isLoading = context.read<GoogleAuthCubit>();
    var setSharedPref = context.read<SharedPrefCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (constext) => EmailLoginCubit()),
        BlocProvider(create: (context) => RememberMeCubit()),
      ],
      child: LoginViewBody(
          isUserData: isUserData,
          storeUserData: storeUserData,
          isLoading: isLoading,
          setSharedPref: setSharedPref,
          size: size),
    );
  }
}
