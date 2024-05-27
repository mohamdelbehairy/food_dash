part of 'auth_settings_cubit.dart';

sealed class AuthSettingsState {}

final class AuthSettingsInitial extends AuthSettingsState {}

final class SendEmailVerificationSuccess extends AuthSettingsState {}

final class AuthSettingsFailure extends AuthSettingsState {
  final String errorMessage;

  AuthSettingsFailure({required this.errorMessage});
}
