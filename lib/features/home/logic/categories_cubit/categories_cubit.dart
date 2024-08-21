import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/categories_cubit/categories_state.dart';
import 'package:food_dash/features/home/repository/categories_repository.dart';

import '../../model/categories_model.dart';

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

  List<CategoriesModel> categoriesList = [];
  void getCategories() {
    emit(GetCategoriesLoadinf());
    try {
      FirebaseFirestore.instance
          .collection('categories')
          .orderBy('category_id', descending: false)
          .snapshots()
          .listen((snapshot) {
        categoriesList = [];
        for (var element in snapshot.docs) {
          categoriesList.add(CategoriesModel.fromMap(element.data()));
        }
        emit(GetCategoriesSuccess(categoriesModel: categoriesList));
      });
    } catch (e) {
      emit(GetCategoriesFailure());
    }
  }
}
