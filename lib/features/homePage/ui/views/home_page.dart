import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/homePage/ui/widgets/categories.dart';
import 'package:food_dash/features/homePage/ui/widgets/discount_guaranteed.dart';
import 'package:food_dash/features/homePage/ui/widgets/home_header.dart';
import 'package:food_dash/features/homePage/ui/widgets/home_search.dart';
import 'package:food_dash/features/homePage/ui/widgets/special_offers.dart';
import 'package:go_router/go_router.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
