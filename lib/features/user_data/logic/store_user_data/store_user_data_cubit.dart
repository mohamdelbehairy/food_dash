import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/core/models/user_data_model.dart';

part 'store_user_data_state.dart';

class StoreUserDataCubit extends Cubit<StoreUserDataState> {
  StoreUserDataCubit() : super(StoreUserDataInitial());

  Future<void> storeUserData({
    required String profileImage,
    required String fullName,
    required String nickName,
    required String dateOfBirth,
    required String email,
    required String phoneNumber,
    required String gender,
  }) async {
    emit(StoreUserDataLoading());
    try {
      UserDataModel userDataModel = UserDataModel.fromJson({
        'userID': Constants.currentUser.uid,
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
          .doc(Constants.currentUser.uid)
          .set(userDataModel.toJson());
      emit(StoreUserDataSuccess());
    } catch (e) {
      emit(StoreUserDataFailure(errorMessage: e.toString()));
      debugPrint('error from store user data cubit: ${e.toString()}');
    }
  }
}
