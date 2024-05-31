import 'package:flutter/material.dart';

import '../models/provider_auth_item_model.dart';
import 'provider_auth_list_view_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.items, required this.size});

  final List<ProviderAuthItemModel> items;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProviderAuthListviewitem(
            size: size,
            items: items[index],
            onTap: () {
              if (index == 0) {
                debugPrint('Continue with Facebook');
              } else if (index == 1) {
                debugPrint('Continue with Google');
              } else {
                debugPrint('Continue with Phone');
              }
            },
          );
        });
  }
}
