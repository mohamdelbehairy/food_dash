import 'package:flutter/material.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_colors.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:food_dash/core/utils/app_styles.dart';
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
    _controller.addListener(() {
      if (_controller.isCompleted) {
        GoRouter.of(context).push(AppRouter.onboarding);
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
