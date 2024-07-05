
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/special_offers/model/special_offers_model.dart';
import 'package:food_dash/features/special_offers/special_offers_cubit.dart/special_offers_state.dart';

class SpecialOffersCubit extends Cubit<SpecialOffersState> {
  SpecialOffersCubit() : super(SpecialOffersInitial());
   static SpecialOffersCubit get(context) => BlocProvider.of(context);

   final List specialOfferList=SpecialOffersModel.CreateOffersCard();
}
