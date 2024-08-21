import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/products_cubit/products_cubit.dart';
import 'package:food_dash/features/home/logic/products_cubit/products_state.dart';
import 'package:food_dash/features/home/repository/products_repository.dart';
import 'package:food_dash/features/home/ui/widgets/discount_category_widget.dart';

import 'discount_guaranted_list_view_loading_indicator.dart';

class DiscountGuaranteedBody extends StatelessWidget {
  const DiscountGuaranteedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(ProductsRepository())..getProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          var product = context.read<ProductsCubit>();
          if (state is GetProductsLoading) {
            return DiscountGuarantedListViewLoadingIndicator();
          } else if (state is GetProductsFailure) {
            return Center(
              child: Text(
                'Error fetching discounted products',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 16),
            child: Container(
              height: 300,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 18),
                itemCount: product.products.length,
                itemBuilder: (context, index) {
                  return DiscountCategoryComponent(
                      item: product.products[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
