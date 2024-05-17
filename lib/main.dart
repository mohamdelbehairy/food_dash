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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
      routerConfig: AppRouter.router,
    );
  }
}
