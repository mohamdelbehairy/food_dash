import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'provider_auth_view_component.dart';

class ProviderAuthViewBody extends StatelessWidget {
  const ProviderAuthViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ProviderAuthViewComponent(size: size)));
  }
}
