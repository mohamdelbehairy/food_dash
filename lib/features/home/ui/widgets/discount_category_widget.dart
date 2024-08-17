import 'package:flutter/material.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/model/product_model.dart';
// ignore: must_be_immutable
class DiscountCategoryComponent extends StatelessWidget {
  DiscountCategoryComponent(BuildContext context, this.item, {super.key});
  ProductsModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      margin: EdgeInsets.only(bottom: 6, left: 2, top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              blurRadius: 1.7,
              offset: Offset(-1, 1),
              spreadRadius: 1.7,
              color: const Color.fromARGB(255, 245, 240, 240))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${item.image}'
                          //  '${Constants.userDataViewImageUrl}'
                            
                            ),
                        fit: BoxFit.cover)
                        
                        ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
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
                        style:
                            AppStyles.styleBold14.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.product_name ?? 'jjj',
              style: AppStyles.styleBold16,
              overflow: TextOverflow.ellipsis,
            ),
             SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                  '${ item.distance ?? 0.0} Km | ',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
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
                  '${ item.rate ?? 0.0} ',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                ),
                Text(
                  "(${ item.rateCount ?? 0}k)",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
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
                      '\$${ item.price ??0.0} | ',
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
                      '\$${ item.price??0.0*(item.discountRatio??0.0/100)}',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                drawSvgIcon(item.isFavourite?? true?'heart_fill':'heart_outline', iconColor: Colors.red,height: 22,width: 22)
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
