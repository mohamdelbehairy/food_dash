import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/products_cubit/products_cubit.dart';
import 'package:food_dash/features/home/logic/products_cubit/products_state.dart';
import 'package:food_dash/features/home/repository/products_repository.dart';
import 'package:food_dash/features/home/ui/widgets/discount_category_widget.dart';

class DiscountGuaranteedBody extends StatelessWidget {
  const DiscountGuaranteedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(ProductsRepository()),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsInitialState) {
            context.read<ProductsCubit>().fetchDiscountProducts();
            return Center(child: CircularProgressIndicator());
          } else if (state is GetProductsSuccess) {
            var product = state.productsModel;
            return Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 16),
              child: Container(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 18),
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return DiscountCategoryComponent(
                      context,
                      state.productsModel[index],
                    );
                  },
                ),
              ),
            );
          } else if (state is GetProductsFailure) {
            return Center(
              child: Text(
                'Error fetching discounted products',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return Center(
              child: Text('Unexpected state: $state'),
            );
          }
        },
      ),
    );
  }
}
