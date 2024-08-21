import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_fading_widget.dart';
import 'category_image_indicator.dart';

class CategoriesGradViewLoadingIndicator extends StatelessWidget {
  const CategoriesGradViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          height: 190,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 12),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.2,
                crossAxisCount: 4,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CategoryImageIndicator(),
                    SizedBox(height: 10),
                    CustomFadingWidget(
                        child: Container(
                      height: 3,
                      width: 30,
                      color: Colors.grey,
                    ))
                  ],
                ),
              );
            },
          )),
    ));
  }
}
