import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_state.dart';
import 'package:food_dash/features/home/repository/categories_repository.dart';
import 'package:food_dash/features/home/ui/widgets/category_component_widget.dart';
import 'package:go_router/go_router.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(CategoryRepository()),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) => (),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                height: 190,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.2,
                      crossAxisCount: 4,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2),
                  itemBuilder: (BuildContext context, int index) {
                    // var categoriesCubit = state.categoriesModel;
                    if (state is CategoriesInitialState) {
                      context.read<CategoriesCubit>().fetchCategories();
                      return Center(child: CircularProgressIndicator());
                    } else if (state is GetCategoriesSuccess) {
                      var categoriesCubit = state.categoriesModel;
                      if (index == 7) {
                        return InkWell(
                          onTap: () => GoRouter.of(context)
                              .push(AppRouter.all_categories),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                drawSvgIconColored('Fast_food',
                                    width: 38, height: 38),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: 66,
                                    child: Text(
                                      "More",
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        );
                      }
                      return CategoryComponentWidget(
                          context, categoriesCubit[index]);
                    } else if (state is GetCategoriesFailure) {
                      return Center(child: Text('Error'));
                    } else {
                      return Center(child: Text('Unexpected state: $state'));
                    }
                  },
                )),
          );
        },
      ),
    );
  }
}
