import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/home/model/header_icon_model.dart';

import 'profile_header_icon_widget.dart';

class ProfileHeaderIcons extends StatelessWidget {
  const ProfileHeaderIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileHeaderIconWidget(
            headerIconModel:
                HeaderIconModel(icon: Icons.notifications, onTap: () {})),
        SizedBox(width: 14),
        ProfileHeaderIconWidget(
            headerIconModel: HeaderIconModel(
                icon: Icons.shopping_bag_rounded,
                onTap: () => AppRouter.router.go(AppRouter.cart))),
      ],
    );
  }
}
