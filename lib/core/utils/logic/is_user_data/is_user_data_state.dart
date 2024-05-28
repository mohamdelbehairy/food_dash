part of 'is_user_data_cubit.dart';

sealed class IsUserDataState {}

final class IsUserDataInitial extends IsUserDataState {}

final class IsUserDataLoading extends IsUserDataState {}

final class IsUserDataSuccess extends IsUserDataState {}

final class IsUserDataFailure extends IsUserDataState {
  final String errorMessage;

  IsUserDataFailure({required this.errorMessage});
}
