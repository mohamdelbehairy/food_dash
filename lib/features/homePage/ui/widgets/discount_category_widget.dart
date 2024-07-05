import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/homePage/model/discount_guaranteed_model.dart';

// ignore: must_be_immutable
class DiscountCategoryComponent extends StatelessWidget {
  DiscountCategoryComponent(BuildContext context, this.item, {super.key});
  DiscountGuaranteedModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      margin: EdgeInsets.only(bottom: 6,left: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              blurRadius: 1.7,
              offset: Offset(1, 3),
              spreadRadius: 1.7,
              color: const Color.fromARGB(255, 245, 240, 240))
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                image: AssetImage(item.image??Assets.imagesOnBoardringOne),
                fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                'PROMO',
                style: AppStyles.styleBold14.copyWith(color: Colors.white),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
