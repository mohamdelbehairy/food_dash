import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_details/app_colors.dart';
import '../../models/bottom_navigation_bar_model.dart';

BottomNavigationBarItem customBottomNavigationBarItem(
    {required BottomNavigationBarModel bottomNavigationBarModel}) {
  return BottomNavigationBarItem(
      icon: SvgPicture.asset(
          bottomNavigationBarModel.currentIndex ==
                  bottomNavigationBarModel.index
              ? bottomNavigationBarModel.activeIcon
              : bottomNavigationBarModel.inActiveIcon,
          colorFilter: ColorFilter.mode(
              bottomNavigationBarModel.currentIndex ==
                      bottomNavigationBarModel.index
                  ? AppColors.mainColor
                  : Color(0xffa9a8a9),
              BlendMode.srcIn),
          height: bottomNavigationBarModel.currentIndex ==
                  bottomNavigationBarModel.index
              ? bottomNavigationBarModel.activeItemHight
              : bottomNavigationBarModel.inActiveItemHight),
      label: bottomNavigationBarModel.label);
}
