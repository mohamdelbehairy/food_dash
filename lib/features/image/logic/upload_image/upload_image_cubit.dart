import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  bool isLoading = false;
  Future<String> uploadImage({required File imageFile}) async {
    emit(UploadImageLoading(isLoading: true));
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('images/$imageName');
      await reference.putFile(imageFile);
      String imageUrl = await reference.getDownloadURL();
      emit(UploadImageSuccess());
      emit(UploadImageLoading(isLoading: false));
      return imageUrl;
    } catch (e) {
      emit(UploadImageFailure(errorMessage: e.toString()));
      emit(UploadImageLoading(isLoading: false));
      debugPrint('error from upload image cubit: ${e.toString()}');
    }
    return '';
  }
}
