import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/core/models/user_data_model.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());

  void getUserData() {
    emit(GetUserDataLoading());
    try {
      FirebaseFirestore.instance
          .collection(Constants.userCollection)
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<UserDataModel> user = snapshot.docs
              .map((e) => UserDataModel.fromJson(e.data()))
              .toList();
          emit(GetUserDataSuccess(user: user));
        }
      });
    } catch (e) {
      emit(GetUserDataFailure(errorMessage: e.toString()));
      debugPrint('error from get user data method: $e');
    }
  }
}
