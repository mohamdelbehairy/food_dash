import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/homePage/ui/widgets/special_offer_body.dart';
import 'package:food_dash/features/special_offers/ui/widgets/special_offers_body.dart';
import 'package:go_router/go_router.dart';

class SpecialOffersPage extends StatelessWidget {
  const SpecialOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () => GoRouter.of(context).push(AppRouter.homeView),
              child: Icon(Icons.arrow_back)),
          title: Text(
            "Special Offers",
            style:
                AppStyles.styleSemiBold20.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: SpecialOffersBody());
  }
}
