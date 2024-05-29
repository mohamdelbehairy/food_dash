part of 'shared_pref_cubit.dart';


sealed class SharedPrefState {}

final class SharedPrefInitial extends SharedPrefState {}

final class UserSharedPrefSuccess extends SharedPrefState {}
