import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_dash/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:food_dash/features/cart/ui/widgets/cart_widget.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          CartCubit cartCubitInstance = CartCubit.get(context);
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: cartCubitInstance.orderList.length,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              itemBuilder: (context, index) =>
                  CartWidget(context, cartCubitInstance.orderList[index]));
        },
      ),
    );
  }
}
