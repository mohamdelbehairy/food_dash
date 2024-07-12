
class CategoriesModel {
  final int id;
  final String imageUrl;
  final String title;
  final List<RecommendedModel> products;

  CategoriesModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.products});
}

class RecommendedModel {
  final String? image;
  final String? ServicesName;
  final Function()? route;
  final bool? isFavourite;
  final String? name;
  final double? distance;
  final double? rate;
  final double? price;
  final double? discountRatio;
  final int? rateCount;

  RecommendedModel({
    this.image,
    this.ServicesName,
    this.route,
    this.isFavourite,
    this.discountRatio,
    this.name,
    this.distance,
    this.rate,
    this.price,
    this.rateCount,
  });

 }
