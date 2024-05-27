import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/bloc_observer.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:food_dash/firebase_options.dart';

import 'features/auth/logic/auth_setting/auth_settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FoodDash());
}

class FoodDash extends StatelessWidget {
  const FoodDash({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    return BlocProvider(
      create: (context) => AuthSettingsCubit(),
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  backgroundColor: Colors.transparent)),
          routerConfig: AppRouter.router),
    );
  }
}
