import 'package:flutter/material.dart';
import 'package:food_dash/features/home_page/ui/widgets/categories.dart';
import 'package:food_dash/features/home_page/ui/widgets/discount_guaranteed.dart';
import 'package:food_dash/features/home_page/ui/widgets/home_header.dart';
import 'package:food_dash/features/home_page/ui/widgets/home_search.dart';
import 'package:food_dash/features/home_page/ui/widgets/recommended_for_you_body.dart';
import 'package:food_dash/features/home_page/ui/widgets/recpmended_header.dart';
import 'package:food_dash/features/home_page/ui/widgets/special_offers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 26,
                ),
                HomeHeader(),
                HomeSearch(),
                SpecialOffers(),
                Categories(),
                DiscountGuaranteed(),
                RecommendedHeader(),
                RecommendedForYouBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
