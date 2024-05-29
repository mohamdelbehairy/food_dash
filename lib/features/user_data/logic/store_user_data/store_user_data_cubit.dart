import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/core/models/user_data_model.dart';

part 'store_user_data_state.dart';

class StoreUserDataCubit extends Cubit<StoreUserDataState> {
  StoreUserDataCubit() : super(StoreUserDataInitial());

  bool isLoading = false;
  Future<void> storeUserData({
    required String profileImage,
    required String fullName,
    required String nickName,
    required String dateOfBirth,
    required String email,
    required String phoneNumber,
    required String gender,
  }) async {
    emit(StoreUserDataLoading(isLoading: true));
    try {
      UserDataModel userDataModel = UserDataModel.fromJson({
        'userID': FirebaseAuth.instance.currentUser!.uid,
        'profileImage': profileImage,
        'fullName': fullName,
        'nickName': nickName,
        'dateOfBirth': dateOfBirth,
        'email': email,
        'phoneNumber': phoneNumber,
        'gender': gender
      });
      await FirebaseFirestore.instance
          .collection(Constants.userCollection)
          .doc(userDataModel.userID)
          .set(userDataModel.toJson());
      emit(StoreUserDataSuccess());
      emit(StoreUserDataLoading(isLoading: false));
    } catch (e) {
      emit(StoreUserDataFailure(errorMessage: e.toString()));
      emit(StoreUserDataLoading(isLoading: false));
      debugPrint('error from store user data cubit: ${e.toString()}');
    }
  }
}
