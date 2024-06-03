import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_colors.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:food_dash/core/utils/app_styles.dart';
import 'package:food_dash/core/utils/logic/shared_pref/shared_pref_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Animation<Offset>? _leftPhotoAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _controller.addListener(() async {
      if (_controller.isCompleted) {
        var getSharedPref = context.read<SharedPrefCubit>();
        final token =
            await getSharedPref.getSharedPref(key: Constants.userSharedPref);
        final userAppFirstTime =
            await getSharedPref.getSharedPref(key: Constants.useAppFirstTime);
        if (token.isNotEmpty &&
            userAppFirstTime.isNotEmpty &&
            ((FirebaseAuth.instance.currentUser!.phoneNumber != null &&
                    FirebaseAuth
                        .instance.currentUser!.phoneNumber!.isNotEmpty) ||
                FirebaseAuth.instance.currentUser!.emailVerified)) {
          GoRouter.of(context).go(AppRouter.homeView);
        } else if (token.isEmpty && userAppFirstTime.isNotEmpty) {
          GoRouter.of(context).go(AppRouter.providerAuthView);
        } else {
          GoRouter.of(context).go(AppRouter.onboardingView);
        }
      }
    });
    _leftPhotoAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animation,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(seconds: 0),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SlideTransition(
                            position: _leftPhotoAnimation!,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                drawSvgIconColored('app_icon1',
                                    height: 52, width: 52),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Text("Food Dash",
                                style: AppStyles.styleSemiBold40
                                    .copyWith(fontSize: 40)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.mainColor,
                  size: 56,
                ),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
