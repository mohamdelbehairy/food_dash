import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widgets/custom_provider_way.dart';

class AuthProviderWays extends StatelessWidget {
  const AuthProviderWays({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomProviderWay(
          
            size: size,
            onTap: () {},
            widget: const Icon(FontAwesomeIcons.facebook,
                color: Colors.blue, size: 22)),
        CustomProviderWay(
            size: size,
            onTap: () {},
            widget: Image.asset(Assets.imagesGoogleIcon, width: 25)),
        CustomProviderWay(
            size: size, onTap: () {}, widget: const Icon(Icons.phone, size: 22))
      ],
    );
  }
}
