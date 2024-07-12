import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';
import 'package:food_dash/features/home_page/logic/recommended/recommended_state.dart';
import 'package:food_dash/features/home_page/model/recommed_model.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedInitial());
  static RecommendedCubit get(context) => BlocProvider.of(context);

  List<CategoriesModel> categories = [
    CategoriesModel(title: 'All', imageUrl: 'pizza2', id: 0, products: [
      RecommendedModel(
          image: Assets.imagesOnBoardringOne,
          ServicesName: 'Hamburger',
          name: 'Mixed SaladBontkasnkjas kkld',
          discountRatio: 10,
          distance: 15,
          rate: 4.3,
          rateCount: 12000,
          isFavourite: true,
          price: 6,
          route: () {},
        ),
        RecommendedModel(
          image: Assets.imagesOnBoardringTwo,
          ServicesName: 'Pizza',
          route: () {},
          name: 'kawdjklaw lsdkfael',
          discountRatio: 15,
          distance: 20,
          rate: 3.3,
          rateCount: 4000,
          isFavourite: false,
          price: 10,
        ),
         RecommendedModel(
          image: Assets.imagesOnBoardringThree,
          ServicesName: 'Noodles',
          route: () {},
          name: 'AKHHH DLSKJK SDAW',
          discountRatio: 30,
          distance: 34,
          rate: 3.3,
          rateCount: 5399,
          isFavourite: true,
          price: 20,
        ),
        RecommendedModel(
          image: Assets.imagesOnBoardringOne,
          ServicesName: 'Hamburger',
          name: 'Mixed SaladBontkasnkjas kkld',
          discountRatio: 10,
          distance: 15,
          rate: 4.3,
          rateCount: 12000,
          isFavourite: true,
          price: 6,
          route: () {},
        ),
        RecommendedModel(
          image: Assets.imagesOnBoardringTwo,
          ServicesName: 'Pizza',
          route: () {},
          name: 'kawdjklaw lsdkfael',
          discountRatio: 15,
          distance: 20,
          rate: 3.3,
          rateCount: 4000,
          isFavourite: false,
          price: 10,
        ),
    ]),
    CategoriesModel(
      id: 1,
      imageUrl: "burger",
      title: "burger",
      products: [
        RecommendedModel(
          image: Assets.imagesOnBoardringOne,
          ServicesName: 'Hamburger',
          name: 'Mixed SaladBontkasnkjas kkld',
          discountRatio: 10,
          distance: 15,
          rate: 4.3,
          rateCount: 12000,
          isFavourite: true,
          price: 6,
          route: () {},
        ),
        RecommendedModel(
          image: Assets.imagesOnBoardringTwo,
          ServicesName: 'Pizza',
          route: () {},
          name: 'kawdjklaw lsdkfael',
          discountRatio: 15,
          distance: 20,
          rate: 3.3,
          rateCount: 4000,
          isFavourite: false,
          price: 10,
        ),
      ],

      // cubitt: CubitType(),
      // screen: ShopFeature()
    ),
    CategoriesModel(
      id: 2,
      imageUrl: "pizza1",
      title: "Pizza",
      products: [
        RecommendedModel(
          image: Assets.imagesOnBoardringThree,
          ServicesName: 'Noodles',
          route: () {},
          name: 'AKHHH DLSKJK SDAW',
          discountRatio: 30,
          distance: 34,
          rate: 3.3,
          rateCount: 5399,
          isFavourite: true,
          price: 20,
        ),
        RecommendedModel(
          image: Assets.imagesOnBoardringOne,
          ServicesName: 'Hamburger',
          name: 'Mixed SaladBontkasnkjas kkld',
          discountRatio: 10,
          distance: 15,
          rate: 4.3,
          rateCount: 12000,
          isFavourite: true,
          price: 6,
          route: () {},
        ),
        RecommendedModel(
          image: Assets.imagesOnBoardringTwo,
          ServicesName: 'Pizza',
          route: () {},
          name: 'kawdjklaw lsdkfael',
          discountRatio: 15,
          distance: 20,
          rate: 3.3,
          rateCount: 4000,
          isFavourite: false,
          price: 10,
        ),
      ],

      // cubitt: CubitType(),
      // screen: ShopFeature()
    ),

    CategoriesModel(id: 3, imageUrl: "Drink", title: "Drink", products: [
      RecommendedModel(
        image: Assets.imagesOnBoardringTwo,
        ServicesName: 'Pizza',
        route: () {},
        name: 'kawdjklaw lsdkfael',
        discountRatio: 15,
        distance: 20,
        rate: 3.3,
        rateCount: 4000,
        isFavourite: false,
        price: 10,
      ),
      RecommendedModel(
        image: Assets.imagesOnBoardringThree,
        ServicesName: 'Noodles',
        route: () {},
        name: 'AKHHH DLSKJK SDAW',
        discountRatio: 30,
        distance: 34,
        rate: 3.3,
        rateCount: 5399,
        isFavourite: true,
        price: 20,
      ),
      RecommendedModel(
        image: Assets.imagesOnBoardringOne,
        ServicesName: 'Hamburger',
        name: 'Mixed SaladBontkasnkjas kkld',
        discountRatio: 10,
        distance: 15,
        rate: 4.3,
        rateCount: 12000,
        isFavourite: true,
        price: 6,
        route: () {},
      ),
    ])

    // cubitt: CubitType(),
    // screen: ShopFeature()
  ];

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(RecommendedChangeCategoryState());
  }

  List<CategoriesModel> getMainCategories() {
    return categories;
  }

  List<RecommendedModel> getProductsByCategory({int categoryId = 0}) {
    // if (categoryId == 0) {
    //   List<RecommendedModel> allProducts = [];
    //   for (var category in categories) {
    //     allProducts.addAll(category.products);
    //   }
    //   emit(ShopChangeCategoryState());
    //   return allProducts;
    // } else {
    //   final category = categories.firstWhere((cat) => cat.id == categoryId);
    //   emit(ShopChangeCategoryState());
    //   return category.products;
    // }
    final category = categories.firstWhere((cat) => cat.id == categoryId);
        emit(RecommendedChangeCategoryState());

    return category.products;
  }

  dynamic selectedCat;

  void selectCategory(RecommendedModel category) {
    selectedCat = category;
    emit(RecommendedChangeCategoryState());
  }
}
