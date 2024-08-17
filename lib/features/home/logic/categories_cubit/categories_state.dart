
import 'package:food_dash/features/home/model/categories_model.dart';

 class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}
final class GetCategoriesSuccess extends CategoriesState {
   List<CategoriesModel> categoriesModel;
  GetCategoriesSuccess({required this.categoriesModel});
}
final class GetCategoriesFailure extends CategoriesState {}
final class GetCategoriesLoadinf extends CategoriesState {}
