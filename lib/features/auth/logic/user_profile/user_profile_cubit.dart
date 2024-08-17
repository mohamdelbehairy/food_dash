
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/models/user_data_model.dart';
import 'package:food_dash/features/auth/logic/user_profile/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  ////////////////////////////////////////////////
  //////////////////////////////////////////////// variables
  ////////////////////////////////////////////////
    UserDataModel? userModel;


  ////////////////////////////////////////////////
  //////////////////////////////////////////////// Functions
  ////////////////////////////////////////////////
  ///
  Future<void> getUserProfile(currentUserId) async {
    print('currentUserId: $currentUserId');
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .snapshots()
        .listen((event) async {
      userModel = UserDataModel.fromJson(event.data()!);
     
      print(userModel);
      emit(GetUserProfileState(userModel: userModel!));
    }).onError((handleError) {
      print(handleError.toString());
    });
  }
}
