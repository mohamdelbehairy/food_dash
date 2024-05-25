import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());

  File image = File('');

  Future<void> pickImage({required ImageSource source}) async {
    try {
      final returnImage = await ImagePicker().pickImage(source: source);

      if (returnImage != null) {
        image = File(returnImage.path);
        debugPrint('image picker: ${image.path}');
        emit(PickImageSuccess());
      }
    } catch (e) {
      debugPrint('error from pick image cubit: ${e.toString()}');
      emit(PickImageFailure(errorMessage: e.toString()));
    }
  }
}
