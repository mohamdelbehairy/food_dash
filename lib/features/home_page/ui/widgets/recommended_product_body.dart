import 'package:flutter/material.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home_page/model/recommed_model.dart';
import 'package:food_dash/features/myCart/ui/widgets/cart_image.dart';

// ignore: must_be_immutable
class RecommendedProductBody extends StatelessWidget {
  RecommendedProductBody(BuildContext context, this.product, {super.key});
  RecommendedModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.6,
                offset: Offset(0, 1),
                spreadRadius: 1.6,
                color: const Color.fromARGB(255, 249, 242, 242))
          ]),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Row(
            children: [
              CartImage(
                image: product.image,
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.name}',
                        style: AppStyles.styleBold16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '${product.distance} Km | ',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${product.rate} ',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "(${product.rateCount}k)",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$${product.price} | ',
                                style: AppStyles.styleMedium16,
                              ),
                              Icon(
                                Icons.delivery_dining,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '\$${product.price ?? 0 * (product.discountRatio ?? 0 / 100)}',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          drawSvgIcon(
                              product.isFavourite ?? true
                                  ? 'heart_fill'
                                  : 'heart_outline',
                              iconColor: Colors.red,
                              height: 22,
                              width: 22)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
