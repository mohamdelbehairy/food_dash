import 'package:flutter/material.dart';

import 'provider_auth_view_custom_divider.dart';

class ProviderAuthViewDivider extends StatelessWidget {
  const ProviderAuthViewDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProviderAuthViewCustomDivider(size: size),
          const SizedBox(width: 12),
          const Text('or'),
          const SizedBox(width: 12),
          ProviderAuthViewCustomDivider(size: size),
        ],
      ),
    );
  }
}
