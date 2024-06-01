part of 'user_data_setting_cubit.dart';

sealed class UserDataSettingState {}

final class UserDataSettingInitial extends UserDataSettingState {}

final class UserDataSettingLoading extends UserDataSettingState {}

final class IsUserDataSuccess extends UserDataSettingState {}

final class UpdateUserDataSuccess extends UserDataSettingState {}

final class UserDataSettingFailure extends UserDataSettingState {
  final String errorMessage;

  UserDataSettingFailure({required this.errorMessage});
}
