import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widgets/custom_provider_way.dart';
import '../../logic/google_auth/google_auth_cubit.dart';

class AuthProviderWays extends StatelessWidget {
  const AuthProviderWays(
      {super.key, required this.size, required this.icon, required this.onTap});
  final Size size;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var signInWithGoogle = context.read<GoogleAuthCubit>();
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
            onTap: () async => signInWithGoogle.signInWithGoogle(),
            widget: Image.asset(Assets.imagesGoogleIcon, width: 25)),
        CustomProviderWay(
            size: size, onTap: onTap, widget: Icon(icon, size: 22))
      ],
    );
  }
}
