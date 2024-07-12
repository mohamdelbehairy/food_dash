import 'package:flutter/material.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/features/home_page/model/categories_model.dart';

// ignore: must_be_immutable
class CategoryComponentWidget extends StatelessWidget {
  CategoryComponentWidget(BuildContext context,this.category, {super.key});
  CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          category.image ??drawSvgIconColored('burger', height: 34, width: 34),
          
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
              width: 66,
              child: Text(
                category.ServicesName ?? "Burger",
                
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
