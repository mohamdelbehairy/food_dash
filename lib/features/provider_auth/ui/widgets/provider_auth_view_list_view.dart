import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_details/app_images.dart';
import '../models/provider_auth_item_model.dart';
import 'custom_list_view.dart';

class ProviderAuthViewListView extends StatelessWidget {
  const ProviderAuthViewListView({super.key, required this.size});
  final Size size;

  static final items = [
    ProviderAuthItemModel(
        itemText: 'Continue with Facebook',
        itemWidget: const Icon(FontAwesomeIcons.facebook,
            color: Colors.blue, size: 22)),
    ProviderAuthItemModel(
        itemText: 'Continue with Google',
        itemWidget: Image.asset(Assets.imagesGoogleIcon, width: 30)),
    ProviderAuthItemModel(
        itemText: 'Continue with Phone',
        itemWidget: const Icon(Icons.phone, size: 22)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomListView(items: items, size: size);
  }
}
