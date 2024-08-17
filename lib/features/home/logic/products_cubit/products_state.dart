
import 'package:food_dash/features/home/model/product_model.dart';

sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}
final class GetProductsSuccess extends ProductsState {
   List<ProductsModel> productsModel;
  GetProductsSuccess({required this.productsModel});
}
final class GetProductsFailure extends ProductsState {}
final class GetProductsLoading extends ProductsState {}
