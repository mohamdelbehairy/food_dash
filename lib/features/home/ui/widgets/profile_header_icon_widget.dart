import 'package:flutter/material.dart';

import '../../model/header_icon_model.dart';

class ProfileHeaderIconWidget extends StatelessWidget {
  const ProfileHeaderIconWidget({super.key, required this.headerIconModel});
  final HeaderIconModel headerIconModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: headerIconModel.onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Stack(
            children: [
              Icon(headerIconModel.icon, color: Colors.black, size: 26),
              Positioned(
                  right: 4,
                  top: 4,
                  child: Icon(Icons.circle, color: Colors.red, size: 5)),
            ],
          ),
        ),
      ),
    );
  }
}
