import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_state.dart';

import 'categories_grid_view.dart';
import 'categories_grid_view_loading_indicator.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoadinf) {
          return CategoriesGradViewLoadingIndicator();
        } else if (state is GetCategoriesFailure) {
          return Center(child: Text('Error'));
        }
        return CategoriesGradView();
      },
    );
  }
}


