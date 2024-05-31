import 'package:flutter/material.dart';

import '../models/provider_auth_item_model.dart';
import '../../../../core/utils/widgets/custom_provider_way.dart';

class ProviderAuthListviewitem extends StatelessWidget {
  const ProviderAuthListviewitem(
      {super.key,
      required this.size,
      required this.items,
      required this.onTap});

  final Size size;
  final ProviderAuthItemModel items;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomProviderWay(
        size: size,
        onTap: onTap,
        widget: items.itemWidget,
        text: items.itemText);
  }
}
