import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';

import 'package:food_dash/features/home/ui/widgets/special_offer_body.dart';
import 'package:food_dash/features/home/ui/widgets/special_offer_header.dart';
import 'package:go_router/go_router.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SpecialOfferHeader(),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
             onTap: () =>GoRouter.of(context).go(AppRouter.special_offers,),
            child: SpecialOfferBody())
        ],
      ),
    );
  }
}
