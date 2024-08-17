import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/cart/model/cart_model.dart';
import 'package:food_dash/features/cart/ui/widgets/cart_image.dart';

// ignore: must_be_immutable
class CartWidget extends StatelessWidget {
 CartWidget(
    BuildContext context,
    this.cartObject, {
    super.key,
  });
  CartModel cartObject;
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
      child: Slidable(
        endActionPane: ActionPane(
            motion: const BehindMotion(),
            extentRatio: .28,
            children: [
              SlidableAction(
                onPressed: (context) {},
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
                icon: Icons.delete_outlined,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      CartImage(
                        image: cartObject.image![0],
                      ),
                      Positioned(
                          left: 10,
                          child: CartImage(
                            image: cartObject.image![1],
                          )),
                      Positioned(
                          left: 20,
                          child: CartImage(
                            image: cartObject.image![2],
                          )),
                    ],
                  ),
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
                          cartObject.title ?? "",
                          style: AppStyles.styleBold14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RichText(
                            text: TextSpan(
                                style: AppStyles.styleBold16,
                                children: [
                              TextSpan(
                                text: "${cartObject.count ?? 0} items",
                              ),
                              TextSpan(
                                text: " | ",
                              ),
                              TextSpan(
                                text: " ${cartObject.distance ?? 0.0} Km ",
                              ),
                            ])),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '\$${cartObject.price ?? 0.0}',
                          style: AppStyles.styleSemiBold14,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
