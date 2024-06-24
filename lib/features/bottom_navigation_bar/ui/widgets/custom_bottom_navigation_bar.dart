import 'package:flutter/material.dart';

import '../../../../core/utils/app_details/app_colors.dart';
import '../../../../core/utils/app_details/app_images.dart';
import '../models/bottom_navigation_bar_model.dart';
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
                  image: Assets.imagesHome,
                  index: 0)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Orders',
                  image: Assets.imagesOrders,
                  index: 1)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Message',
                  image: Assets.imagesMessage,
                  index: 2)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'E-Wallet',
                  image: Assets.imagesWallet,
                  index: 3,
                  itemHight: 22)),
          customBottomNavigationBarItem(
              bottomNavigationBarModel: BottomNavigationBarModel(
                  currentIndex: currentIndex,
                  label: 'Profile',
                  image: Assets.imagesPerson,
                  index: 4)),
        ]);
  }
}
