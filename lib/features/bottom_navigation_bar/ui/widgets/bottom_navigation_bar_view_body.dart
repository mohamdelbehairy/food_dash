import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';

class BottomNavigationBarViewBody extends StatefulWidget {
  const BottomNavigationBarViewBody({super.key});

  @override
  State<BottomNavigationBarViewBody> createState() =>
      _BottomNavigationBarViewBodyState();
}

class _BottomNavigationBarViewBodyState
    extends State<BottomNavigationBarViewBody> {
  int _currentIndex = 0;
  List views = [
    Icon(Icons.home),
    Icon(Icons.collections),
    Icon(Icons.message),
    Icon(Icons.wallet),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: views[_currentIndex]),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Color(0xfffffefe)),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              selectedItemColor: AppColors.mainColor,
              showUnselectedLabels: true,
              unselectedItemColor: Color(0xffa9a8a9),
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Assets.imagesUnselectedHome,
                        colorFilter: ColorFilter.mode(
                            Color(0xffa9a8a9), BlendMode.srcIn),
                        height: 24),
                    activeIcon: SvgPicture.asset(Assets.imagesSelectedHome,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                            AppColors.mainColor, BlendMode.srcIn)),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset(Assets.imagesSelectedHome, height: 20),
                    label: 'Orders'),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset(Assets.imagesSelectedHome, height: 20),
                    label: 'Message'),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset(Assets.imagesSelectedHome, height: 20),
                    label: 'E-Wallet'),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset(Assets.imagesSelectedHome, height: 20),
                    label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
