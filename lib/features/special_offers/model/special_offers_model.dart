import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';

class SpecialOffersModel {
  final String? image;

  final int? discount;
  final Color? backGroundColor;

  SpecialOffersModel({this.image, this.discount, this.backGroundColor});
  static List<SpecialOffersModel> CreateOffersCard() {
    return [
      SpecialOffersModel(
          image: Assets.imagesOnBoardringOne,
          discount: 30,
          backGroundColor: AppColors.mainColor),
      SpecialOffersModel(
          image: Assets.imagesOnBoardringOne,
          discount: 15,
          backGroundColor: Colors.amber),
      
      SpecialOffersModel(
          image: Assets.imagesOnBoardringThree,
          discount: 25,
          backGroundColor: Colors.redAccent),
      SpecialOffersModel(
          image: Assets.imagesOnBoardringOne,
          discount: 30,
          backGroundColor: Colors.blueAccent),
      SpecialOffersModel(
          image: Assets.imagesOnBoardringOne,
          discount: 10,
          backGroundColor: Colors.deepPurple),
          SpecialOffersModel(
         backGroundColor: const Color.fromARGB(255, 54, 235, 244),
        image: Assets.imagesHome,
        discount: 20,
      ),
    ];
  }
}
