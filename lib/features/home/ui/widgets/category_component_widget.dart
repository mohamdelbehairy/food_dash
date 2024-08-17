import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dash/features/home/model/categories_model.dart';

// ignore: must_be_immutable
class CategoryComponentWidget extends StatelessWidget {
  CategoryComponentWidget(BuildContext context, this.category, {super.key});
  CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.network('${category.category_image}',height: 38,width: 38,),
              
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.center,
              width: 66,
              child: Text(
                category.category_name ?? "Burger",
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
