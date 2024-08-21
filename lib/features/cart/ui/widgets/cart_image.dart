import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/constants.dart';

// ignore: must_be_immutable
class CartImage extends StatelessWidget {
   CartImage({super.key,this.image});
  String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 90,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                image ??Constants.userDataViewImageUrl,
              ),
              fit: BoxFit.cover)),
    );
  }
}
