import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_fading_widget.dart';

class ProfileImageLoadingIndicator extends StatelessWidget {
  const ProfileImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(22)),
      ),
    );
  }
}
