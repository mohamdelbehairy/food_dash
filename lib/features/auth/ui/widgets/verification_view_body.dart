import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/auth/logic/auth_setting/auth_settings_cubit.dart';
import 'package:go_router/go_router.dart';
import 'verification_view_section.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key, required this.size});
  final Size size;

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    if (!isEmailVerified) {
      context.read<AuthSettingsCubit>().sendEmailVerification();
    }
    timer = Timer.periodic(
        const Duration(seconds: 3), (timer) => checkEmailVerified());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VerificationViewSection(
        size: widget.size, isEmailVerified: isEmailVerified);
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      debugPrint('isEmailVerified: $isEmailVerified');
    });

    if (isEmailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      GoRouter.of(context).push(AppRouter.loginView);
      timer?.cancel();
    }
  }
}
