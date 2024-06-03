import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/google_auth/google_auth_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../models/provider_auth_item_model.dart';
import 'provider_auth_list_view_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.items, required this.size});

  final List<ProviderAuthItemModel> items;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var signInWithGoogle = context.read<GoogleAuthCubit>();

    return ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProviderAuthListviewitem(
            size: size,
            items: items[index],
            onTap: () async {
              if (index == 0) {
                debugPrint('Continue with Facebook');
              } else if (index == 1) {
                debugPrint('Continue with Google');
                await signInWithGoogle.signInWithGoogle();
              } else {
                debugPrint('Continue with Phone');
                GoRouter.of(context).push(AppRouter.registerPhoneNumber);
              }
            },
          );
        });
  }
}
