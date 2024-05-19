import 'package:flutter/material.dart';
import 'package:food_dash/features/auth/ui/views/register_view.dart';
import 'package:food_dash/features/onboarding/ui/views/onboarding_screen.dart';
import 'package:food_dash/features/provider_auth/ui/views/provider_auth_view.dart';
import 'package:food_dash/features/splash/ui/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const providerAuth = '/provider_auth';
  static const onboarding = '/onboarding';
  static const registerView = '/registerView';

  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
        path: providerAuth,
        builder: (context, state) => const ProviderAuthView()),
    GoRoute(path: onboarding, builder: (context, state) => OnboardingPage()),
    GoRoute(path: registerView, builder: (context, state) => RegisterView()),
  ]);
}
