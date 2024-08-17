sealed class SpecialOffersState {}

final class SpecialOffersInitial extends SpecialOffersState {}

final class GetSpecialOffersSuccess extends SpecialOffersState {
  List<Map<String, dynamic>> productsModel;
  GetSpecialOffersSuccess({required this.productsModel});
}

final class GetSpecialOffersFailure extends SpecialOffersState {}

final class GetSpecialOffersLoading extends SpecialOffersState {}
