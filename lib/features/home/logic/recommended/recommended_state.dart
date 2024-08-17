import 'package:food_dash/features/home/model/categories_model.dart';
import 'package:food_dash/features/home/model/product_model.dart';

// Base class for all states
sealed class RecommendedState {}

// Initial state, when nothing has been loaded yet
class RecommendedInitial extends RecommendedState {}

// State while categories or products are being fetched
class RecommendedLoading extends RecommendedState {}

// State when categories have been successfully loaded
class CategoriesLoaded extends RecommendedState {
  final List<CategoriesModel> categories;

  CategoriesLoaded(this.categories);
}

// State when products have been successfully loaded for a selected category
class ProductsLoaded extends RecommendedState {
  final List<ProductsModel> products;

  ProductsLoaded(this.products);
}

// State for handling errors
class RecommendedError extends RecommendedState {
  final String message;

  RecommendedError(this.message);
}
