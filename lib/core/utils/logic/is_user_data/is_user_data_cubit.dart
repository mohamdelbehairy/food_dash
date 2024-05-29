import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';

part 'is_user_data_state.dart';

class IsUserDataCubit extends Cubit<IsUserDataState> {
  IsUserDataCubit() : super(IsUserDataInitial());

  Future<bool> isUserData() async {
    emit(IsUserDataLoading());
    try {
      final documnt = await FirebaseFirestore.instance
          .collection(Constants.userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      emit(IsUserDataSuccess());
      return documnt.exists;
    } catch (e) {
      emit(IsUserDataFailure(errorMessage: e.toString()));
      debugPrint('error from is user data: ${e.toString()}');
      return false;
    }
  }
}
