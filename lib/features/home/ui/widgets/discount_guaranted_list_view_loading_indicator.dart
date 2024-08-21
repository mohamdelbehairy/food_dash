import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_fading_widget.dart';

class DiscountGuarantedListViewLoadingIndicator extends StatelessWidget {
  const DiscountGuarantedListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 16),
        child: Container(
          height: 300,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 18),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: 236,
                margin: EdgeInsets.only(bottom: 6, left: 2, top: 2),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 1.7,
                  //       offset: Offset(-1, 1),
                  //       spreadRadius: 1.7,
                  //       color: const Color.fromARGB(255, 245, 240, 240))
                  // ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
