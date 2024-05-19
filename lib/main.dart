import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_dash/core/utils/app_router.dart';

void main() {
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
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent)),
      routerConfig: AppRouter.router,
    );
  }
}
