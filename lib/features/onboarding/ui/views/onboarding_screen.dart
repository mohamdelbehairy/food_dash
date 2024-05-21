import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_dash/core/utils/app_router.dart';
import 'package:food_dash/core/utils/app_styles.dart';
import 'package:food_dash/core/utils/components/custom_button_item.dart';
import 'package:food_dash/core/utils/components/shimmer/animated_widgets.dart';
import 'package:food_dash/features/onboarding/model/onboarding_model.dart';
import 'package:food_dash/features/onboarding/ui/widgets/animated_page_indicator.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final OnBoardingtModel contentModel = OnBoardingtModel();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(contentModel.images[index]),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HexColor('#3C3A3A').withAlpha(130),
                    HexColor('#3C3A3A').withAlpha(80),
                    HexColor('#3C3A3A').withAlpha(100),
                    HexColor('#3C3A3A').withAlpha(90),
                    HexColor('#3C3A3A').withAlpha(100),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    // const SizedBox(height: 24),
                    Expanded(
                      child: PageView(
                        onPageChanged: (value) => setState(() {
                          index = value;
                        }),
                        controller: controller,
                        children: List.generate(
                          contentModel.titles.length,
                          (index) => ListAnimator(
                            data: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    contentModel.titles[index],
                                    textAlign: TextAlign.center,
                                    style: AppStyles.styleSemiBold40.copyWith(
                                        color: const Color.fromARGB(
                                            255, 11, 248, 90)),
                                  ),
                                  const SizedBox(height: 30),
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style: AppStyles.styleSemiBold20
                                              .copyWith(color: Colors.white),
                                          children: [
                                            TextSpan(
                                                text:
                                                    contentModel.values[index]),
                                          ]))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    index == contentModel.titles.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButtonItem(
                                onTap: () {
                                  print('aAs');
                                  AppRouter.router.go(AppRouter.providerAuthView);
                                },
                                buttonName: 'Let\'s go',
                                radius: 18,
                                width: (MediaQuery.of(context).size.width / 3),
                                height: 48,
                                borderColor: Colors.white,
                                buttonColor: Colors.white.withOpacity(0.4),
                                textStyle: AppStyles.styleSemiBold28.copyWith(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                                // width: 100,
                                size: size,
                              )
                            ],
                          )
                        : Container(),
                    SizedBox(
                        height:
                            index == contentModel.titles.length - 1 ? 40 : 0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          contentModel.titles.length,
                          (value) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.5),
                                child: AnimatedPageIndicatorOnboarding(
                                    check: index == value),
                              )),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
