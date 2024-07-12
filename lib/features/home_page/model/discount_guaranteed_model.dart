import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';

class DiscountGuaranteedModel {
  final String? image;
  final String? ServicesName;
  final Function()? route;
  final bool? isFavourite;
  final String? name;
  final double? distance;
  final double? rate;
  final double? price;
  final double? discountRatio;
  final int? rateCount;

  Cubit? cubitt;
  Widget? screen;

  DiscountGuaranteedModel(
      {this.image,
      this.ServicesName,
      this.route,
      this.cubitt,
      this.screen,
      this.isFavourite,
      this.discountRatio,
      this.name,
      this.distance,
      this.rate,
      this.price,
      this.rateCount,
      });
  static List<DiscountGuaranteedModel> CreateDiscountGuaranteedCard() {
    return [
      DiscountGuaranteedModel(
        image: Assets.imagesOnBoardringOne,
        ServicesName: 'Hamburger',
        name: 'Mixed SaladBontkasnkjas kkld',
        discountRatio: 10,
        distance: 15,
        rate: 4.3,
        rateCount: 12000,
        isFavourite: true,
        price: 6,

        route: () {},
        // cubitt: CubitType(),
        // screen: ShopFeature()
      ),
      DiscountGuaranteedModel(
          image: Assets.imagesOnBoardringTwo,
          ServicesName: 'Pizza',
          route: () {},
           name: 'kawdjklaw lsdkfael',
        discountRatio: 15,
        distance: 20,
        rate: 3.3,
        rateCount: 4000,
        isFavourite: false,
        price: 10,
          
          
          ),
      DiscountGuaranteedModel(
          image: Assets.imagesOnBoardringThree,
          ServicesName: 'Noodles',
          route: () {},
          
           name: 'AKHHH DLSKJK SDAW',
        discountRatio: 30,
        distance: 34,
        rate: 3.3,
        rateCount: 5399,
        isFavourite: true,
        price: 20,
          ),
    ];
  }
}
