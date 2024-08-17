import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_state.dart';
import 'package:food_dash/features/home/repository/categories_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository _categoryRepository;

  CategoriesCubit(this._categoryRepository) : super(CategoriesInitialState());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> fetchCategories() async {
    try {
      final categories = await _categoryRepository.getCategories();
      emit(GetCategoriesSuccess(categoriesModel: categories));
    } catch (e) {
      emit(GetCategoriesFailure());
    }
  }
}
