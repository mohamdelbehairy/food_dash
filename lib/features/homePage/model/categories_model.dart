
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/handler/icon_handler.dart';

class CategoriesModel {
  final Widget? image;
  final String? ServicesName;
  final Function()? route;
  Cubit? cubitt;
  Widget? screen;

  CategoriesModel({this.image, this.ServicesName, this.route,this.cubitt,this.screen});
  static List<CategoriesModel> CreateCategoriesCard() {
    return [
      CategoriesModel(
          image: drawSvgIconColored('burger',height: 36, width: 36),
          ServicesName: 'Hamburger',
          route: () {
           
          },
          // cubitt: CubitType(),
          // screen: ShopFeature()
          ),
      CategoriesModel(
          image: drawSvgIconColored('pizza1',height: 36, width: 36),
          ServicesName: 'Pizza',
          route: () {
           
          }),
      CategoriesModel(
          image: drawSvgIconColored('Instant_noodles',height: 34, width: 34),
          ServicesName: 'Noodles',
          route: () {
            
          }),
      CategoriesModel(
          image: drawSvgIconColored('Fresh_meat',height: 34, width: 34),
          ServicesName: 'Meat',
          route: () {
            
          }),
      CategoriesModel(
          image: drawSvgIconColored('Vegetables',height: 34, width: 34),
          ServicesName: 'Vegetable',
          route: () {
            
          }),
      CategoriesModel(
          image: drawSvgIconColored('Blueberry_cake',height: 34, width: 34),
          ServicesName: 'Dessert',
          route: () {
            
          }),
      CategoriesModel(
          image: drawSvgIconColored('Drink2',height: 34, width: 34),
          ServicesName: 'Drink',
          route: () {
            
          }),
      CategoriesModel(
          image: drawSvgIconColored('Fast_food',height: 34, width: 34),
          ServicesName: 'More',
          route: () {
            
          }),
    ];
  }
}
