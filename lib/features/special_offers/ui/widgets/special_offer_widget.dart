import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/model/product_model.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class SpecialOfferWidget extends StatelessWidget {
  SpecialOfferWidget(
    BuildContext context,
    this.specialOffersObject, {
    super.key,
  });
  Map<String,dynamic> specialOffersObject;

  @override
  Widget build(BuildContext context) {
   Map<String, dynamic> category = specialOffersObject;

     List<ProductsModel> discountedProducts =
                      category['discountedProducts'];
                  ProductsModel highestDiscountedProduct =
                      discountedProducts.reduce((a, b) =>
                          a.discountRatio! > b.discountRatio! ? a : b);
    return Container(
      width: MediaQuery.of(context).size.width,
    
      margin: EdgeInsets.symmetric(horizontal: 20),
      // height: 200,
      decoration: BoxDecoration(
        color: HexColor(specialOffersObject['categoryColor']),
        borderRadius: BorderRadius.circular(26),
        // image: DecorationImage(image: AssetImage(Assets.imagesOnBoardringOne),fit: BoxFit.cover)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${highestDiscountedProduct.discountRatio!.toStringAsFixed(0)}%",
                    style: AppStyles.styleSemiBold48
                        .copyWith(color: Colors.white, fontSize: 58),
                  ),
                  Text(
                    "DISCOUNT ONLY VAILD FOR TODAY!",
                    style: AppStyles.styleSemiBold18.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SvgPicture.network(
              '${specialOffersObject['categoryImage']}',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
