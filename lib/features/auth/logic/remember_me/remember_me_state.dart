part of 'remember_me_cubit.dart';

sealed class RememberMeState {}

final class RememberMeInitial extends RememberMeState {}

final class RememberMeSuccess extends RememberMeState {
  final bool isClick;

  RememberMeSuccess({required this.isClick});
}
