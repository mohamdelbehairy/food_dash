part of 'user_shared_pref_cubit.dart';

@immutable
sealed class UserSharedPrefState {}

final class UserSharedPrefInitial extends UserSharedPrefState {}

final class UserSharedPrefSuccess extends UserSharedPrefState {}
