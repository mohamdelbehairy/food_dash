import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/logic/recommended/recommended_cubit.dart';
import 'package:food_dash/features/home/logic/recommended/recommended_state.dart';
import 'package:food_dash/features/home/model/recommed_model.dart';
import 'package:food_dash/features/home/ui/widgets/recommended_product_body.dart';

class RecommendedForYouBody extends StatefulWidget {
  const RecommendedForYouBody({super.key});

  @override
  State<RecommendedForYouBody> createState() => _RecommendedForYouBodyState();
}

class _RecommendedForYouBodyState extends State<RecommendedForYouBody> {
  var categories = RecommendedCubit().categories;
  CategoriesModel? selectedCategory;
  Color selectColor = Colors.orange;
  bool iconn = false;
  @override
  void initState() {
    setState(() {
      selectedCategory = categories.isNotEmpty ? categories.first : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: 10),
          BlocProvider(
            create: (BuildContext context) => RecommendedCubit(),
            child: BlocBuilder<RecommendedCubit, RecommendedState>(
              builder: (context, state) {
                var bloc = RecommendedCubit.get(context);
                print(categories);
                return SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    // physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      if (state is Empty) {
                        return Container();
                      } else if (state is Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is Error) {
                        return Container();
                      } else {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                              if (selectedCategory!.id == 0) {
                                bloc.getProductsByCategory(categoryId: 0);
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedCategory == category
                                  ? AppColors.mainColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.mainColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (category.imageUrl.isNotEmpty)
                                  drawSvgIconColored(
                                    category.imageUrl,
                                    height: 23,
                                    width: 23,
                                  ),
                                if (category.imageUrl.isNotEmpty)
                                  SizedBox(width: 5),
                                Text(
                                  category.title,
                                  style: AppStyles.styleBold14.copyWith(
                                    color: selectedCategory == category
                                        ? Colors.white
                                        : AppColors.mainColor,
                                    fontSize: 17,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemCount: categories.length,
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: selectedCategory != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ListView.separated(
                              primary: false,
                              itemBuilder: (context, index) {
                                final product =
                                    selectedCategory!.products[index];
                                return RecommendedProductBody(context, product);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: selectedCategory!.products.length),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'Select a category',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
