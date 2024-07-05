import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';

class DiscountGuaranteedModel {
  final String? image;
  final String? ServicesName;
  final Function()? route;
  Cubit? cubitt;
  Widget? screen;

  DiscountGuaranteedModel(
      {this.image, this.ServicesName, this.route, this.cubitt, this.screen});
  static List<DiscountGuaranteedModel> CreateDiscountGuaranteedCard() {
    return [
      DiscountGuaranteedModel(
        image: Assets.imagesOnBoardringOne,
        ServicesName: 'Hamburger',
        route: () {},
        // cubitt: CubitType(),
        // screen: ShopFeature()
      ),
      DiscountGuaranteedModel(
          image: Assets.imagesOnBoardringTwo,
          ServicesName: 'Pizza',
          route: () {}),
      DiscountGuaranteedModel(
          image: Assets.imagesOnBoardringThree,
          ServicesName: 'Noodles',
          route: () {}),
    ];
  }
}
