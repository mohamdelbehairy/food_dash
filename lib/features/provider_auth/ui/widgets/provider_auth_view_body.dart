import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/components/custom_button_item.dart';
import '../../../../core/utils/components/already_have_account_or_not.dart';
import '../../../../core/utils/components/divider_text_item.dart';
import 'provider_auth_view_image.dart';
import 'provider_auth_view_list_view.dart';
import '../../../../core/utils/components/custom_text_item.dart';

class ProviderAuthViewBody extends StatelessWidget {
  const ProviderAuthViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            ProviderAuthViewImage(size: size),
            const CustomTextItem(
                text: 'Let\'s you in', style: AppStyles.styleSemiBold40),
            ProviderAuthViewListView(size: size),
            DividerTextitem(dividerSize: size.width * .36, text: 'or'),
            CustomButtonItem(
                buttonName: 'Sign in with email address',
                size: size,
                onTap: () {}),
            const SizedBox(height: 24),
            AlreadyHaveAccountOrNot(
              text: 'Don\'t have an account? ',
              textButton: 'Sign up',
              onTap: () => GoRouter.of(context).push(AppRouter.registerView),
            )
          ],
        ),
      ),
    );
  }
}
