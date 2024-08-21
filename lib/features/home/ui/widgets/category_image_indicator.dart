import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_fading_widget.dart';

class CategoryImageIndicator extends StatelessWidget {
  const CategoryImageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(19),
      ),
    ));
  }
}
