import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/homePage/bloc/categories_cubit/categories_cubit_cubit.dart';
import 'package:food_dash/features/homePage/bloc/categories_cubit/categories_cubit_state.dart';
import 'package:food_dash/features/homePage/ui/widgets/category_component_widget.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: BlocConsumer<CategoriesCubit, CategoriesCubitState>(
        listener: (context, state) => (),
        builder: (context, state) {
          CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                height: 160,
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
                    return CategoryComponentWidget(
                        context, categoriesCubit.categories[index]);
                  },
                )),
          );
        },
      ),
    );
  }
}
