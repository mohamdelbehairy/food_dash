import 'package:flutter/material.dart';
import 'package:food_dash/utils/app_router.dart';

void main() {
  runApp(const FoodDash());
}

class FoodDash extends StatelessWidget {
  const FoodDash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}