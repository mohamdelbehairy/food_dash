import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_styles.dart';

class CustomProviderWay extends StatelessWidget {
  const CustomProviderWay(
      {super.key,
      required this.size,
      required this.onTap,
      required this.widget,
      required this.text});

  final Size size;
  final Function() onTap;
  final Widget widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(.15)),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 8),
              child: Text(
                text,
                style: AppStyles.styleBold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
