import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';

part 'user_data_setting_state.dart';

class UserDataSettingCubit extends Cubit<UserDataSettingState> {
  UserDataSettingCubit() : super(UserDataSettingInitial());

  Future<bool> isUserData() async {
    emit(UserDataSettingLoading());
    try {
      final documnt = await FirebaseFirestore.instance
          .collection(Constants.userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      emit(IsUserDataSuccess());
      return documnt.exists;
    } catch (e) {
      emit(UserDataSettingFailure(errorMessage: e.toString()));
      debugPrint('error from is user data method: ${e.toString()}');
      return false;
    }
  }

  Future<void> updateUserData(
      {required String fieldName,
      String? fieldValueStr,
      bool? fieldValueBool}) async {
    emit(UserDataSettingLoading());
    try {
      await FirebaseFirestore.instance
          .collection(Constants.userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({fieldName: fieldValueStr ?? fieldValueBool});
      emit(UpdateUserDataSuccess());
    } catch (e) {
      emit(UserDataSettingFailure(errorMessage: e.toString()));
      debugPrint('error from update user data method: $e');
    }
  }
}
