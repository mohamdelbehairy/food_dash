import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import 'provider_auth_view_text.dart';

class AlreadyHaveAccountOrNot extends StatelessWidget {
  const AlreadyHaveAccountOrNot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const ProviderAuthViewText(
          text: 'Don\'t have an account? ', style: AppStyles.styleReqular14),
      const SizedBox(width: 4),
      GestureDetector(
        onTap: () {},
        child: const ProviderAuthViewText(
            text: 'Sign up', style: AppStyles.styleSemiBold14),
      )
    ]);
  }
}
