import 'package:flutter/material.dart';

import '../models/provider_auth_item_model.dart';
import 'custom_provider_way.dart';

class ProviderAuthListviewitem extends StatelessWidget {
  const ProviderAuthListviewitem(
      {super.key, required this.size, required this.items});

  final Size size;
  final ProviderAuthItemModel items;

  @override
  Widget build(BuildContext context) {
    return CustomProviderWay(
        size: size,
        onTap: items.onTap,
        widget: items.itemWidget,
        text: items.itemText);
  }
}
