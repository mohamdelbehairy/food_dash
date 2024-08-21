import 'package:flutter/material.dart';
import 'package:food_dash/features/home/ui/widgets/categories.dart';
import 'package:food_dash/features/home/ui/widgets/discount_guaranteed.dart';
import 'package:food_dash/features/home/ui/widgets/home_header.dart';
import 'package:food_dash/features/home/ui/widgets/home_search.dart';
import 'package:food_dash/features/home/ui/widgets/recommended_for_you_body.dart';
import 'package:food_dash/features/home/ui/widgets/recpmended_header.dart';
import 'package:food_dash/features/home/ui/widgets/special_offers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 26),
                HomeHeader(),
                HomeSearch(),
                // SpecialOffers(),
                Categories(),
                // DiscountGuaranteed(),
                // RecommendedHeader(),
                // RecommendedForYouBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
