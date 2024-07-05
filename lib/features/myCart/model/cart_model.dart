import 'package:food_dash/core/utils/app_details/app_images.dart';

class CartModel {
  final List<String>? image;
  final String? title;
  final String? description;
  final int? count;
  final double? distance;
  final double? price;

  CartModel(
      {this.image,
      this.title,
      this.count,
      this.description,
      this.distance,
      this.price});
  static List<CartModel> CreateCartCard() {
    return [
      CartModel(
        title: "Mixed salad Boniklaslka dsksjl",
        description:
            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
        image: [
          Assets.imagesOnBoardringOne,
          Assets.imagesOnBoardringTwo,
          Assets.imagesHome
        ],
        count: 3,
        distance: 16,
        price: 20,
      ),
      CartModel(
        title: "pizza",
        description:
            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
        image: [
           Assets.imagesOnBoardringTwo,
          Assets.imagesOnBoardringOne,
         
          Assets.imagesHome
        ],
        count: 6,
        distance: 27,
        price: 50,
      ),
      CartModel(
        title: "Humburger",
        description:
            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
        image: [
            Assets.imagesHome,
          Assets.imagesOnBoardringOne,
          Assets.imagesOnBoardringTwo,
        
        ],
        count: 6,
        distance: 11,
        price: 40,
      ),
      CartModel(
        title: "cake",
        description:
            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
        image: [
          Assets.imagesOnBoardringThree,
           Assets.imagesHome,
          Assets.imagesOnBoardringTwo,
         
        ],
        count: 1,
        distance: 16,
        price: 70,
      ),
      CartModel(
        title: "MOltan cake",
        description:
            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
        image: [
          Assets.imagesOnBoardringOne,
          Assets.imagesOnBoardringTwo,
          Assets.imagesWelcomeOne
        ],
        count: 3,
        distance: 16,
        price: 20,
      ),
      CartModel(
        title: "Noddles",
        description:
            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
        image: [
          Assets.imagesOnBoardringOne,
          Assets.imagesOnBoardringTwo,
          Assets.imagesHome
        ],
        count: 3,
        distance: 16,
        price: 20,
      ),
    ];
  }
}
