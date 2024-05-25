part of 'pick_image_cubit.dart';

sealed class PickImageState {}

final class PickImageInitial extends PickImageState {}

final class PickImageSuccess extends PickImageState {
  final File image;

  PickImageSuccess({required this.image});
}

final class PickImageFailure extends PickImageState {
  final String errorMessage;

  PickImageFailure({required this.errorMessage});
}
