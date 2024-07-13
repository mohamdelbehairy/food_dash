import 'package:flutter/material.dart';

import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/app_details/app_images.dart';
import '../../models/bottom_navigation_bar_model.dart';
import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: currentIndex,
        selectedItemColor: AppColors.mainColor,
        showUnselectedLabels: true,
        unselectedItemColor: Color(0xffa9a8a9),
        onTap: onTap,
        items: [
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Home',
                  activeIcon: Assets.imagesActiveHome,
                  inActiveIcon: Assets.imagesInactiveHome,
                  index: 0,
                  activeItemHight: 26)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Orders',
                  activeIcon: Assets.imagesActiveOrders,
                  inActiveIcon: Assets.imagesInactiveOrders,
                  activeItemHight: 26,
                  index: 1)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Message',
                  activeIcon: Assets.imagesActiveMessage,
                  inActiveIcon: Assets.imagesInactiveMessage,
                  activeItemHight: 30,
                  inActiveItemHight: 28,
                  index: 2)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'E-Wallet',
                  activeIcon: Assets.imagesActiveWallet,
                  inActiveIcon: Assets.imagesInactiveWallet,
                  activeItemHight: 22,
                  index: 3)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Profile',
                  activeIcon: Assets.imagesActivePerson,
                  inActiveIcon: Assets.imagesInactivePerson,
                  activeItemHight: 24,
                  index: 4)),
        ]);
  }
}
