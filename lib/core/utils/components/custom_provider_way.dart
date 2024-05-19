import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_styles.dart';

class CustomProviderWay extends StatelessWidget {
  const CustomProviderWay(
      {super.key,
      required this.size,
      required this.onTap,
      required this.widget,
      this.text});

  final Size size;
  final Function() onTap;
  final Widget widget;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 14, horizontal: text == null ? 28 : 0.0),
        margin: EdgeInsets.only(top: text == null ? 0.0 : 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(.15)),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            if (text != null)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 8),
                child: Text(text!, style: AppStyles.styleBold16),
              ),
          ],
        ),
      ),
    );
  }
}
