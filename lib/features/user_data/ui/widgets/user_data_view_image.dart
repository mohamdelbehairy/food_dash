import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';

class UserDataViewImage extends StatelessWidget {
  const UserDataViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16,bottom: 24),
      child: Stack(
        children: [
          CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg')),
          Positioned(
            right: 8,
            bottom: 4,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Icon(FontAwesomeIcons.pen, color: Colors.white, size: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
