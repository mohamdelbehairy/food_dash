
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_details/app_router.dart';
import 'category_component_widget.dart';

class CategoriesGradView extends StatelessWidget {
  const CategoriesGradView({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemBuilder: (context, index) {
              var categoriesCubit =
                  context.read<CategoriesCubit>().categoriesList;
              if (index == 7) {
                return InkWell(
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.all_categories),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        drawSvgIconColored('Fast_food', width: 38, height: 38),
                        SizedBox(height: 10),
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
              return CategoryComponentWidget(category: categoriesCubit[index]);
            },
          )),
    );
  }
}