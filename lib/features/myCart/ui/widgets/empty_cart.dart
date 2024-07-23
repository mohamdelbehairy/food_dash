import 'package:flutter/material.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          drawSvgIcon('cart',width: 200,height: 200),
          SizedBox(height: 20,),
          Text('Empty',style: AppStyles.styleBold16.copyWith(fontSize: 22),),
          SizedBox(height: 10,),
          Text('You don\'t have any foods in cart at this time',style: AppStyles.styleReqular14.copyWith(color: Colors.black),)
        ],
      ),
    );
  }
}