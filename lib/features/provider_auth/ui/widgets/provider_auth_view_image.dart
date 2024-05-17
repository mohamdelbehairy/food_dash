import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class ProviderAuthViewImage extends StatelessWidget {
  const ProviderAuthViewImage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * .05),
      child: Image.asset(
        Assets.imagesProviderAuth,
        height: size.height * .25,
        fit: BoxFit.cover,
      ),
    );
  }
}
