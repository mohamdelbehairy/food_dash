import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button_item.dart';
import 'already_have_account_or_not.dart';
import 'provider_auth_view_divider.dart';
import 'provider_auth_view_image.dart';
import 'provider_auth_view_list_view.dart';
import 'provider_auth_view_text.dart';

class ProviderAuthViewBody extends StatelessWidget {
  const ProviderAuthViewBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProviderAuthViewImage(size: size),
          const ProviderAuthViewText(
              text: 'Let\'s you in', style: AppStyles.styleSemiBold40),
          ProviderAuthViewListView(size: size),
          ProviderAuthViewDivider(size: size),
          CustomButtonItem(
              buttonName: 'Sign in with email address',
              size: size,
              onTap: () {}),
          const SizedBox(height: 24),
          const AlreadyHaveAccountOrNot()
        ],
      ),
    );
  }
}
