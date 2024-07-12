
sealed class RecommendedState {}

final class RecommendedInitial extends RecommendedState {}
class RecommendedIntialStates extends RecommendedState{}
class RecommendedChangeCategoryState extends RecommendedState{}
class Empty extends RecommendedState {}
class Loading extends RecommendedState {}
class Error extends RecommendedState {}
class Done extends RecommendedState {}
