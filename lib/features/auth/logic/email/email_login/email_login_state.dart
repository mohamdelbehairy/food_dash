part of 'email_login_cubit.dart';

sealed class EmailLoginState {}

final class EmailLoginInitial extends EmailLoginState {}

final class EmailLoginLoading extends EmailLoginState {}

final class EmailLoginSuccess extends EmailLoginState {}

final class EmailLoginFailure extends EmailLoginState {
  final String errorMessage;

  EmailLoginFailure({required this.errorMessage});
}
