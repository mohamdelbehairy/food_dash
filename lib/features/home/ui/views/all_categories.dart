import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_state.dart';
import 'package:food_dash/features/home/repository/categories_repository.dart';
import 'package:food_dash/features/home/ui/widgets/category_component_widget.dart';
import 'package:go_router/go_router.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More Category',
          style: AppStyles.styleSemiBold20
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
            onTap: () => GoRouter.of(context).push(AppRouter.homeView),
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: BlocProvider(
          create: (context) => CategoriesCubit(CategoryRepository()),
          child: BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) => (),
            builder: (context, state) {
              if (state is CategoriesInitialState) {
                context.read<CategoriesCubit>().fetchCategories();
                return Center(child: CircularProgressIndicator());
              } else if (state is GetCategoriesSuccess) {
                // CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
                var categoriesCubit = state.categoriesModel;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                      height: 190,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        itemCount: categoriesCubit.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisCount: 4,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryComponentWidget(
                              context, categoriesCubit[index]);
                        },
                      )),
                );
              } else if (state is GetCategoriesFailure) {
                return Center(child: Text('Error'));
              } else {
                return Center(child: Text('Unexpected state: $state'));
              }
            },
          ),
        ),
      ),
    );
  }
}
