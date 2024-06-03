part of 'phone_number_cubit.dart';

sealed class PhoneNumberState {}

final class PhoneNumberInitial extends PhoneNumberState {}

final class SendCodeLoading extends PhoneNumberState {
  final bool isLoading;

  SendCodeLoading({required this.isLoading});
}

final class SendCodeSuccess extends PhoneNumberState {}

final class SendCodeFailure extends PhoneNumberState {
  final String errorMessage;
  SendCodeFailure({required this.errorMessage});
}

final class VerifyPhoneNumberSuccess extends PhoneNumberState {}

final class VerifyPhoneNumberFailure extends PhoneNumberState {
  final String errorMessage;
  VerifyPhoneNumberFailure({required this.errorMessage});
}
