part of 'shared_pref_cubit.dart';

@immutable
sealed class SharedPrefState {}

final class SharedPrefInitial extends SharedPrefState {}

final class SetSharedPrefSuccess extends SharedPrefState {}

final class GetSharedPrefSuccess extends SharedPrefState {}
