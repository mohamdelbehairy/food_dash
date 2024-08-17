import 'package:food_dash/constants.dart';

class ProductsModel {
  final String? image;
  final bool? isFavourite;
  final String? product_name;
  final num? distance;
  final num? rate;
  final num? price;
  final num? discountRatio;
  final num? rateCount;

  ProductsModel({
    this.image,
    this.isFavourite,
    this.discountRatio,
    this.product_name,
    this.distance,
    this.rate,
    this.price,
    this.rateCount,
  });
  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      discountRatio: map['discountRatio'] ?? 0.0,
      distance: map['distance'] ?? 0.0,
      image: map['image'] ?? Constants.userDataViewImageUrl,
      isFavourite: map['isFavourite'] ?? false,
      price: map['price'] ?? 0.0,
      product_name: map['product_name'] ?? "",
      rate: map['rate'] ?? 0.0,
      rateCount: map['rateCount'] ?? 0.0,
    );
  }
}
