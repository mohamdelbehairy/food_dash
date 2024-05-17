import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_images.dart';
import '../models/provider_auth_item_model.dart';
import 'provider_auth_list_view_item.dart';

class ProviderAuthViewListView extends StatelessWidget {
  const ProviderAuthViewListView({super.key, required this.size});
  final Size size;

  static final items = [
    ProviderAuthItemModel(
        onTap: () {},
        itemText: 'Continue with Facebook',
        itemWidget: const Icon(
          FontAwesomeIcons.facebook,
          color: Colors.blue,
          size: 22,
        )),
    ProviderAuthItemModel(
        onTap: () {},
        itemText: 'Continue with Google',
        itemWidget: Image.asset(Assets.imagesGoogleIcon, width: 30)),
    ProviderAuthItemModel(
        onTap: () {},
        itemText: 'Continue with Phone',
        itemWidget: const Icon(Icons.phone, size: 22)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProviderAuthListviewitem(size: size, items: items[index]);
        });
  }
}
