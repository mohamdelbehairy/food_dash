

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:food_dash/features/cart/model/cart_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
   static CartCubit get(context) => BlocProvider.of(context);

   final List orderList=CartModel.CreateCartCard();
}
