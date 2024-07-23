import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/handler/icon_handler.dart';

class CategoriesModel {
  final Widget? image;
  final String? ServicesName;
  final Function()? route;
  Cubit? cubitt;
  Widget? screen;

  CategoriesModel(
      {this.image, this.ServicesName, this.route, this.cubitt, this.screen});
  static List<CategoriesModel> CreateCategoriesCard() {
    return [
      CategoriesModel(
        image: drawSvgIconColored('burger', height: 38, width: 38),
        ServicesName: 'Hamburger',
        route: () {},
        // cubitt: CubitType(),
        // screen: ShopFeature()
      ),
      CategoriesModel(
          image: drawSvgIconColored('pizza1', height: 36, width: 36),
          ServicesName: 'Pizza',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Instant_noodles', height: 36, width: 36),
          ServicesName: 'Noodles',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Fresh_meat', height: 36, width: 36),
          ServicesName: 'Meat',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Vegetables', height: 36, width: 36),
          ServicesName: 'Vegetable',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Blueberry_cake', height: 36, width: 36),
          ServicesName: 'Dessert',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Drink2', height: 36, width: 36),
          ServicesName: 'Drink',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Bread', height: 36, width: 36),
          ServicesName: 'Bread',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Croissant', height: 36, width: 36),
          ServicesName: 'Croissant',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Pancakes_Pancakes', height: 36, width: 36),
          ServicesName: 'Pancakes',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Cheese', height: 36, width: 36),
          ServicesName: 'Cheese',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('French_fries', height: 36, width: 36),
          ServicesName: 'French Fries',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Sandwich', height: 36, width: 36),
          ServicesName: 'Sandwich',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Taco', height: 36, width: 36),
          ServicesName: 'Taco',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Pasta', height: 36, width: 36),
          ServicesName: 'Pot of Pasta',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Salad', height: 36, width: 36),
          ServicesName: 'Salad',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Bento_icon', height: 36, width: 36),
          ServicesName: 'Bento',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Rice', height: 36, width: 36),
          ServicesName: 'Cooked Rice',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Spaghetti', height: 36, width: 36),
          ServicesName: 'Spaghetti',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Sushi', height: 36, width: 36),
          ServicesName: 'Sushi',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Ice_cream', height: 36, width: 36),
          ServicesName: 'Ice Cream',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Cookies', height: 36, width: 36),
          ServicesName: 'Cookies',
          route: () {}),
      CategoriesModel(
          image: drawSvgIconColored('Beverage', height: 36, width: 36),
          ServicesName: 'Beverage',
          route: () {}),
      CategoriesModel(
        image: drawSvgIconColored('Fast_food', height: 36, width: 36),
        ServicesName: 'More',
        route: () {},
      ),
    ];
  }
}
