import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/logic/recommended/recommended_cubit.dart';
import 'package:food_dash/features/home/logic/recommended/recommended_state.dart';
import 'package:food_dash/features/home/model/categories_model.dart';
import 'package:food_dash/features/home/model/product_model.dart';
import 'package:food_dash/features/home/repository/recommended_repository.dart';
import 'package:food_dash/features/home/ui/widgets/recommended_product_body.dart';

// ignore: must_be_immutable
class RecommendedForYouBody extends StatelessWidget {
  RecommendedForYouBody({super.key});
  CategoriesModel? selectedCategory;
  int category_id = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendedCubit(RecommendedRepository())..loadCategories(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            SizedBox(height: 10),
            BlocConsumer<RecommendedCubit, RecommendedState>(
              listener: (context, state) {
                if (state is RecommendedError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.message}')),
                  );
                } else if (state is CategoriesLoaded) {
                  var bloc = RecommendedCubit.get(context);
                  bloc.allCategories = state.categories;
                  bloc.loadProducts(0);
                  // Automatically load products for category_id = 0
                  if (category_id == 0) {
                    bloc.loadProducts(0);
                  }
                }
              },
              builder: (context, state) {
                var bloc = RecommendedCubit.get(context);
                var categories = bloc.allCategories;

                return SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        final category = CategoriesModel(
                          category_id: 0,
                          category_name: 'ALL',
                          category_image: '',
                        );

                        return GestureDetector(
                          onTap: () {
                            category_id = 0;
                            selectedCategory = category;
                            print('Fetching all products');
                            bloc.loadProducts(0);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: category_id == 0
                                  ? AppColors.mainColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.mainColor, width: 2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                drawSvgIconColored(
                                  'Checked_Button',
                                  height: 23,
                                  width: 23,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'ALL',
                                  style: AppStyles.styleBold14.copyWith(
                                      color: category_id == category.category_id
                                          ? Colors.white
                                          : AppColors.mainColor,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        final category = categories[index - 1];
                        return GestureDetector(
                          onTap: () {
                            category_id = category.category_id!;
                            selectedCategory = category;
                            print(
                                'Fetching products for category: ${category.category_id}');
                            bloc.loadProducts(category.category_id!);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: category_id == category.category_id
                                  ? AppColors.mainColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.mainColor, width: 2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (category.category_image != null &&
                                    category.category_image!.isNotEmpty)
                                  SvgPicture.network(
                                    category.category_image!,
                                    height: 23,
                                    width: 23,
                                  ),
                                if (category.category_image != null &&
                                    category.category_image!.isNotEmpty)
                                  SizedBox(width: 5),
                                Text(
                                  category.category_name!,
                                  style: AppStyles.styleBold14.copyWith(
                                    color: category_id == category.category_id
                                        ? Colors.white
                                        : AppColors.mainColor,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemCount: categories.length + 1,
                  ),
                );
              },
            ),
            Expanded(
              flex: 1,
              child: BlocConsumer<RecommendedCubit, RecommendedState>(
                listener: (context, state) {
                  if (state is ProductsLoaded) {
                    print('Products loaded: ${state.products.length}');
                  } else if (state is RecommendedError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Error fetching products: ${state.message}')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProductsLoaded) {
                    List<ProductsModel> products = [];

                    products = state.products;
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      child: products.isNotEmpty
                          ? ListView.separated(
                              primary: false,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return RecommendedProductBody(context, product);
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              itemCount: products.length,
                            )
                          : Center(
                              child: Text('No products available',
                                  style: TextStyle(fontSize: 20))),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
