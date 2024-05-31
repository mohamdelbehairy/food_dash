import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/google_auth/google_auth_cubit.dart';

import 'core/utils/app_router.dart';
import 'core/utils/app_system_ui_style.dart';
import 'core/utils/logic/is_user_data/is_user_data_cubit.dart';
import 'core/utils/logic/shared_pref/shared_pref_cubit.dart';
import 'features/auth/logic/auth_setting/auth_settings_cubit.dart';

class FoodDash extends StatelessWidget {
  const FoodDash({super.key});

  @override
  Widget build(BuildContext context) {
    appSystemUiStyleMethod();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthSettingsCubit()),
          BlocProvider(create: (context) => SharedPrefCubit()),
          BlocProvider(create: (constext) => IsUserDataCubit()..isUserData()),
          BlocProvider(create: (context) => GoogleAuthCubit())
        ],
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                    backgroundColor: Colors.transparent)),
            routerConfig: AppRouter.router));
  }
}
