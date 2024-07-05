import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/homePage/bloc/categories_cubit/categories_cubit_state.dart';
import 'package:food_dash/features/homePage/model/categories_model.dart';
class CategoriesCubit extends Cubit<CategoriesCubitState> {
  CategoriesCubit() : super(CategoriesCubitInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

   final List categories=CategoriesModel.CreateCategoriesCard();
}
