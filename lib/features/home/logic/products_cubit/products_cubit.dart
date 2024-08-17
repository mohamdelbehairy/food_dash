import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/products_cubit/products_state.dart';
import 'package:food_dash/features/home/repository/products_repository.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsCubit(this._productsRepository) : super(ProductsInitialState());
  static ProductsCubit get(context) => BlocProvider.of(context);

  //  final List categories=DiscountGuaranteedModel.CreateDiscountGuaranteedCard();
  Future<void> fetchDiscountProducts() async {
    try {
      final products = await _productsRepository.getDiscountedProducts();
      print('PPPPPPPPPP');
      print('products $products');
      emit(GetProductsSuccess(productsModel: products));
    } catch (e) {
      emit(GetProductsFailure());
    }
  }
}
