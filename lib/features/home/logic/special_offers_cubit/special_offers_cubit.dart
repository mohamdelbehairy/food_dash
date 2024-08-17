import 'package:bloc/bloc.dart';
import 'package:food_dash/features/home/logic/special_offers_cubit/special_offers_state.dart';
import 'package:food_dash/features/home/repository/special_offers_repository.dart';

class SpecialOffersCubit extends Cubit<SpecialOffersState> {
  final SpecialOffersRepository _specialOffersRepository;

  SpecialOffersCubit(this._specialOffersRepository)
      : super(SpecialOffersInitial());
  Future<void> getSpecialOffets() async {
    try {
      final specialProducts = await _specialOffersRepository.getSpecialOffers();
      print('specialProducts $specialProducts');
      emit(GetSpecialOffersSuccess(productsModel: specialProducts));
    } catch (e) {
      emit(GetSpecialOffersFailure());
    }
  }
}
