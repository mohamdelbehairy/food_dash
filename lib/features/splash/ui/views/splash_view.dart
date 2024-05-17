import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    duration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void duration() async {
    await Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.providerAuth);
    });
  }
}
