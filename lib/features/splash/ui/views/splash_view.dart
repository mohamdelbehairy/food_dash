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

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    duration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
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
                        drawSvgIconColored('app_icon1', height: 52, width: 52),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Food Dash",
                            style: AppStyles.styleSemiBold40
                                .copyWith(fontSize: 40)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            LoadingAnimationWidget.hexagonDots(
              color: AppColors.mainColor,
              size: 56,
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      )),
    );
  }

  void duration() async {
    await Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).push(AppRouter.providerAuth);
    });
  }
}
