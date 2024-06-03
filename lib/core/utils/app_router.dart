import 'package:flutter/material.dart';
import 'package:food_dash/features/auth/ui/views/login_view.dart';
import 'package:food_dash/features/auth/ui/views/opt_phone_number_view.dart';
import 'package:food_dash/features/auth/ui/views/phone_number_view.dart';
import 'package:food_dash/features/auth/ui/views/register_view.dart';
import 'package:food_dash/features/home/ui/views/home_view.dart';
import 'package:food_dash/features/onboarding/ui/views/onboarding_screen.dart';
import 'package:food_dash/features/provider_auth/ui/views/provider_auth_view.dart';
import 'package:food_dash/features/splash/ui/views/splash_view.dart';
import 'package:food_dash/features/user_data/ui/views/user_data_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/ui/views/verification_view.dart';

abstract class AppRouter {
  static const providerAuthView = '/providerAuthView';
  static const onboardingView = '/onboardingView';
  static const registerView = '/registerView';
  static const loginView = '/loginView';
  static const optPhoneNumberView = '/optPhoneNumberView';
  static const userDataView = '/userDataView';
  static const verificationView = '/verificationView';
  static const homeView = '/homeView';
  static const phoneNumberView = '/phoneNumberView';

  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
        path: providerAuthView,
        builder: (context, state) => const ProviderAuthView()),
    GoRoute(
        path: onboardingView, builder: (context, state) => OnboardingPage()),
    GoRoute(path: registerView, builder: (context, state) => RegisterView()),
    GoRoute(path: loginView, builder: (context, state) => LoginView()),
    GoRoute(
        path: optPhoneNumberView,
        builder: (context, state) => OptPhoneNumberView()),
    GoRoute(path: userDataView, builder: (context, state) => UserDataView()),
    GoRoute(
        path: verificationView,
        builder: (context, state) => VerificationView()),
    GoRoute(path: homeView, builder: (context, state) => HomeView()),
    GoRoute(path: phoneNumberView,builder: (context,state)=> PhoneNumberView())
  ]);
}
