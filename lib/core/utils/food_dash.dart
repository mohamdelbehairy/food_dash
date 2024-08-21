import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/logic/get_user_data/get_user_data_cubit.dart';
import 'package:food_dash/features/auth/logic/google_auth/google_auth_cubit.dart';
import 'package:food_dash/features/payment/logic/paymob_payment/paymob_payment_cubit.dart';
import 'package:food_dash/features/payment/logic/strip_payment/strip_payment_cubit.dart';

import '../../features/home/logic/categories_cubit/categories_cubit.dart';
import '../../features/home/repository/categories_repository.dart';
import 'app_details/app_router.dart';
import 'app_details/app_system_ui_style.dart';
import 'logic/user_data_setting/user_data_setting_cubit.dart';
import 'logic/shared_pref/shared_pref_cubit.dart';
import '../../features/auth/logic/auth_setting/auth_settings_cubit.dart';
import '../../features/auth/logic/phone_number/phone_number_cubit.dart';
import '../../features/auth/logic/remember_me/remember_me_cubit.dart';
import '../../features/user_data/logic/store_user_data/store_user_data_cubit.dart';

class FoodDash extends StatelessWidget {
  const FoodDash({super.key});

  @override
  Widget build(BuildContext context) {
    appSystemUiStyleMethod();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthSettingsCubit()),
          BlocProvider(create: (context) => SharedPrefCubit()),
          BlocProvider(
              create: (constext) => UserDataSettingCubit()..isUserData()),
          BlocProvider(create: (context) => GoogleAuthCubit()),
          BlocProvider(create: (context) => StoreUserDataCubit()),
          BlocProvider(create: (context) => GetUserDataCubit()..getUserData()),
          BlocProvider(create: (context) => RememberMeCubit()),
          BlocProvider(create: (context) => PhoneNumberCubit()),
          BlocProvider(create: (context) => StripPaymentCubit()),
          BlocProvider(create: (context) => PaymobPaymentCubit()),
          BlocProvider(
              create: (context) =>
                  CategoriesCubit(CategoryRepository())..getCategories())
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
