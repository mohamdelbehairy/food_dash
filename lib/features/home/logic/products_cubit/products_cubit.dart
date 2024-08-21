import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/products_cubit/products_state.dart';
import 'package:food_dash/features/home/repository/products_repository.dart';

import '../../model/product_model.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsCubit(this._productsRepository) : super(ProductsInitialState());
  static ProductsCubit get(context) => BlocProvider.of(context);

  //  final List categories=DiscountGuaranteedModel.CreateDiscountGuaranteedCard();
  Future<void> fetchDiscountProducts() async {
    try {
      final products = await _productsRepository.getDiscountedProducts();
      emit(GetProductsSuccess(productsModel: products));
    } catch (e) {
      emit(GetProductsFailure());
    }
  }

  List<ProductsModel> products = [];
  void getProducts() {
    emit(GetProductsLoading());
    try {
      FirebaseFirestore.instance
          .collection('products')
          .where('discountRatio', isNotEqualTo: 0)
          .snapshots()
          .listen((snapshot) {
        products = [];
        for (var element in snapshot.docs) {
          products.add(ProductsModel.fromMap(element.data()));
        }
        log('length ${products.length}');
        emit(GetProductsSuccess(productsModel: products));
      });
    } catch (e) {
      emit(GetProductsFailure());
    }
  }
}
