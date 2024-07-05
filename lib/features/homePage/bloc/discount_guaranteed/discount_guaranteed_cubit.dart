import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/homePage/bloc/discount_guaranteed/discount_guaranteed_state.dart';
import 'package:food_dash/features/homePage/model/discount_guaranteed_model.dart';

class DiscountGuaranteedCubit extends Cubit<DiscountGuaranteedState> {
  DiscountGuaranteedCubit() : super(DiscountGuaranteedInitial());
    static DiscountGuaranteedCubit get(context) => BlocProvider.of(context);

   final List categories=DiscountGuaranteedModel.CreateDiscountGuaranteedCard();
}
